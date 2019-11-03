#method is for error handling when uesrs are prompted to choose between 2 options
def choose2(option1, option2)
    user_input = gets.chomp
    until (user_input == option1) || (user_input == option2)
        puts "Input Error: Enter [#{option1}] or [#{option2}]"
        user_input = gets.chomp
    end
    return user_input
end

#class created for Employees
class Employee
    attr_accessor :name, :salary            #getter/setter so that CEO can edit details

    @@total_employees = 0

    @@employee_database = []

    @@name_list = []                        #name_list array used to determine if employee exists/doesnt exist

    def self.add(employee)                  #small function just to add initial test employees for example
        @@employee_database.push(employee)
        @@name_list.push(employee.name)
    end

    def initialize(name, salary)            
        @name = name
        @salary = salary
        @@total_employees += 1

        @@name_list.push(name)              #pushing each employee name into the name_list for later comparison
    end

    def self.total_count
        puts "Total Employees: #{@@total_employees}"
    end

    def self.display_list()                 #class method for displaying total employeers + details
        system("clear")
        puts "------ Full Employee Details List ------\n\n"
        Employee.total_count()
        puts "----------------"

        for i in @@employee_database
            puts "Name: #{i.name}"
            puts "Salary: $#{i.salary}"
            puts "----------------"
        end

        puts "\nTo Back [b]"
        b = gets.chomp.to_s
        if b == "b"
            continue = true
        else
            Employee.display_list()
        end

    end

    def self.add_employee()                 #class method for adding a new employee
       
        system("clear")
        puts "------ Add Employee ------\n\n"
        print "Enter Name: "
        name = gets.chomp.to_s.capitalize

        if @@name_list.include?(name) == true           #duplicate warning if statement
            puts "Duplicate Warning: There is already a #{name} in the database. Do you wish to continue?"
            puts "Yes [1] No [2]"
            answer = choose2("1", "2")      #example use of initial error handling method at the beginning
            if answer == "2"
                return
            end
        end
        
        print "Enter Salary ($): "
        salary = gets.chomp.to_i

        new_employee = Employee.new(name, salary)

        @@employee_database.push(new_employee)
        
        puts "\n--------------------\nSuccessfully added #{name}."

    end

    def self.search_employee(search)                        #class method for searching database for specific employee
        system("clear")
        puts "------ Search Employee ------\n\n"

        if @@name_list.include?(search) == false
            system("clear")
            puts "------ Search Employee ------\n\n"
            puts "ERROR: Employee does not exit"
            print "Enter Valid Employee Name: "
            Employee.search_employee(gets.chomp.to_s.capitalize)
        else
            system("clear")
            puts "------ Search Employee ------\n\n"
            for employee in @@employee_database
                if employee.name == search
                    puts "Name: #{employee.name}"
                    puts "Salary: $#{employee.salary}"
                end
            end
            puts "Search Another? Yes [y] Back [b]"
            answer = choose2("y", "b")
            if answer == "y"
                system("clear")
                puts "------ Search Employee ------\n\n"
                print "Enter Employee Name: "
                Employee.search_employee(gets.chomp.to_s.capitalize)
            elsif answer == "b"
                return
            end
        end
    end

    def self.edit_salary(name)                  #class method for editing chosen employee

        if @@name_list.include?(name) == false
            system("clear")
            puts "------ Edit Salary ------\n\n"
            puts "ERROR: Employee does not exit"
            print "Enter Valid Employee Name: "
            Employee.edit_salary(gets.chomp.to_s.capitalize)
        else
            system("clear")
            puts "------ Edit Salary ------\n\n"
    
            puts "Enter New Salary for #{name}: "
            new_salary = gets.chomp.to_i

            for i in @@employee_database
                if i.name == name
                    i.salary = new_salary
                end
            end
            puts "Successfully changed #{name}'s Salary to $#{new_salary}"
        end
    end

end

e = Employee.new("Caleb", 100000)       #adding test employees
Employee.add(e)
e = Employee.new("Neil", 40000)
Employee.add(e)
e = Employee.new("Jacob", 60000)
Employee.add(e)


#running the actual program script
continue = true

while continue
    system("clear")                 #puts a simple menu display
    puts "------ Employee Database ------\n\n"
    puts "Select Option:

    Add Employees       [1]
    View Employee List  [2]
    Search Employee     [3]
    Edit Salary         [4]
    Exit                [x]\n\n"
    print "Select: "
    option = gets.chomp

    case option
    when "1"
        add_another = true
        while add_another                           #loop for adding employees until quit prompt
            system("clear")                         #to note I tried including the loop flow into the class method
            Employee.add_employee()                 #however found that it wasnt looping properly 
            puts "Add Another [1] Finish [2]"       #and was somehow duplicating inputs
            option = choose2("1", "2")                  
            if option == "2"
                add_another = false
            end
        end
    when "2"
        Employee.display_list()                             #for the displaying total employees the loop was included
    when "3"                                                #into the class method
        system("clear")
        puts "------ Search Employee ------\n\n"
        print "Enter Employee Name: "
        Employee.search_employee(gets.chomp.to_s.capitalize)
    when "4"
        edit = true
        while edit
            system("clear")
            puts "------ Edit Salary ------\n\n"            #for salary edit option, loop was also not included into class method
            puts "Select Employee to Edit Salary "
            print "Enter Name: "
            Employee.edit_salary(gets.chomp.to_s.capitalize)
            puts "Edit Another? Yes [1] No [2]"
            answer = choose2("1", "2")
            if answer == "2"
                edit = false
            end
        end
    when "x"
        system("clear")
        continue = false
    else
    end
end
