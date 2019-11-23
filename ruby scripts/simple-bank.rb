# hash to store the users' multiple account balances 
account_data = {
    "Savings" => 3000,
    "Everyday Access" => 500,
    "Sharetrading" => 20000,
    "Credit Card" => 5000
}

#function for depositing into bank account 
def deposit(balance, amount)
    
    balance += amount
    puts "Deposit Another Amount [d] | Back [b]"
    user_input = gets.chomp.to_s

    case user_input
    when "d"                                   # case statement allowing multiple deposits until
        system("clear")                        # the user chooses to go back to main menu
        print "Enter Amount to Deposit: $"                      
        deposit(balance, gets.chomp.to_f)
    when "b"
        return balance
    else 
        puts "Unrecognised input. Taking back to menu"
        return balance
        sleep 1
    end
end

#function for withdrawing from bank account
def withdraw(balance, amount)

    if (balance - amount) < 0                                           # if statement for catching Overdraw Withdrawals
        puts "Account Overdraw Alert: Continue [c], No [n]"            
        answer = gets.chomp.to_s

        if answer == "c"
            balance -= amount
            puts "Withdraw Another Amount [w] | Back [b]"
            user_input = gets.chomp.to_s

            case user_input                                # case statement allowing multiple withdrawals
            when "w"                                       # until user decides to go back
                system("clear")
                print "Enter Amount to Withdraw: $"
                withdraw(balance, gets.chomp.to_f)
            when "b"
                return balance 
            else 
                puts "Unrecognised input. Taking back to menu"
                return balance
            end
        else
            return balance
        end
    end

    balance -= amount
    puts "Withdraw Another Amount [w] | Back [b]"
    user_input = gets.chomp.to_s

    case user_input
    when "w"
        system("clear")
        print "Enter Amount to Withdraw: $"
        withdraw(balance, gets.chomp.to_f)
    when "b"
        return balance 
    else 
        puts "Unrecognised input. Taking back to menu"
        return balance
    end

end


#method for displaying the balance
def display_balance(balance)
    puts "Balance: $#{balance}"
    puts "Back [b]"
    back = gets.chomp.to_s

    if back == "b"                      # if statement for allowing users to back into menu on input
        return
    else
        system("clear")
        display_balance(balance)
    end
end

#method for displaying the menu
def menu_display(ac_name)
    system("clear")
    puts "Your #{ac_name} Account:

Options:

    View Balance    [v]
    Deposit Money   [d]
    Withdraw Money  [w]
    Exit            [x]
    "
end


#script for running the bank

system("clear")
puts "Welcome to Caleb's \"Very Secure\" Bank:

Select Account:

    Savings         [1]
    Everyday        [2]
    Sharetrading    [3]
    Credit Card     [4]
    "
print "Select: "
pick = gets.chomp.to_i
case pick                       # case statement for allocating the right account name to be displayed on user input (pick)
when 1                          # in the above argument for the menu_display method
    ac_name = "Savings"
when 2
    ac_name = "Everyday Access"
when 3
    ac_name = "Sharetrading"
when 4
    ac_name = "Credit Card"
else
    puts "ERROR"
end

balance = account_data[ac_name]     # use input(pick) is used here to iterate through the beginning account_data hash
                                    # to set the right starting amount to the balance variable
continue = true

while continue                                          #script loop for running the bank until user quits
    menu_display(ac_name)
    print "Select: "
    option = gets.chomp.to_s
    case option
    when "v"
        system("clear")
        display_balance(balance)
    when "d"
        system("clear")
        print "Enter Amount to Deposit: $"
        balance = deposit(balance, gets.chomp.to_f)
    when "w"
        system("clear")
        print "Enter Amount to Withdraw: $"
        balance = withdraw(balance, gets.chomp.to_f)
    when "x"
        system("clear")
        continue = false
    end
end






