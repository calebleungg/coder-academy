#main hash storing all phonebook contact details

@phone_book_data = {
    "Alex Holder" => {
        number: "+61 000 000 111",
        job: "Educator at Coder Academy",
        address: "118 Walker St, North Sydney, NSW 2060"
    },
    "Ubisoft Australia" => {
        number: "+61 000 000 222",
        job: "Video games sales and support",
        address: "14 Mountain St, Ultimo, NSW 2007"
    },
    "Saad Saaed" => {
        number: "+61 000 000 333",
        job: "Academic & Partnerships Director at Coder Academy",
        address: "118 Walker St, North Sydney, NSW 2060"
    }
}

#function for viewing all contacts of the phonebook in a neat detailed list display
def view
    puts "---------------------------------------"
    for key, value in @phone_book_data do 
        puts "#{key} #{value.fetch(:number)}"
        puts "#{value.fetch(:job)}"
        puts "#{value.fetch(:address)}"
        puts "---------------------------------------"
    end
end

#function for adding a new entry into the main phonebook
def add
    puts "Please Enter Details Below to Add:"
    print "Name: "
    name = gets.chomp.to_s
    print "Number: "
    number = gets.chomp.to_s
    print "Job: "
    job = gets.chomp.to_s
    print "Address: "
    address = gets.chomp.to_s

    @phone_book_data.store(name, {number: number, job: job, address: address})

    puts "\n#{name} has been added to the phone book..."
    sleep 1

end


#function for removing a chosen contact from the phone book using name
def remove

    def choose_name
        system("clear")
        puts "Who do you want to remove?"
        name = gets.chomp.to_s

        if @phone_book_data.has_key?(name) == true
            puts "Are you sure you want to remove #{name} from your phone book? (Yes = y, No = n)"
            choice = gets.chomp.to_s
            if choice == "y"
                @phone_book_data.delete(name)
            elsif choice == "n"
                sleep 1
            else
            end
        else
            puts "Cant find contact. Re-enter an appriopriate name in the database."
            sleep 1
            choose_name
        end
    end

    choose_name

end


#function for displaying the main phonebook menu
def display_menu
    system("clear")
    puts "Phone Book. Type a following option:\n\nview | add | remove | quit\n\nSelect:"
    @option = gets.chomp.to_s.downcase

end


#running the script
menu = 1

while menu == 1

    display_menu

    case @option
    when "view"
        system("clear")
        view
        puts "Type 'back' to return, 'quit' to exit."
        x = gets.chomp.to_s.downcase
        if x == "back"
            menu = 1
        elsif x == "quit"
            system("clear")
            menu = 0
        else
        end
    when "add"
        system("clear")
        add
    when "quit"
        system("clear")
        menu = 0 
    when "remove"
        system("clear")
        remove
    else
    end

end



