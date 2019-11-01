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
    when "d"
        system("clear")
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

    if (balance - amount) < 0 
        puts "Account Overdraw Alert: Continue [c], No [n]"
        answer = gets.chomp.to_s
        if answer == "c"
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
    if back == "b"
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
case pick
when 1
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

balance = account_data[ac_name]

continue = true

while continue 
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




