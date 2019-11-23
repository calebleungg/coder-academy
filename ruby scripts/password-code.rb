pre_def_password = "Password1"
attempt_counter = 5
correct = 0

while attempt_counter > 0 and correct == 0
    print "Enter Password: "
    user_password = gets.chomp

    if user_password == pre_def_password
        system("clear")
        puts "Correct Password. "
        correct += 1
    else
        attempt_counter -= 1
        system("clear")
        puts "Invalid Password. \nAttemps left: #{attempt_counter}"
    end
end

case attempt_counter
when 0 
    puts "You Have Run Out Of Attempts. Locked Out."
else
    puts "Please Enter..."
end


