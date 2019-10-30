#THIS VERSION 2 WORKS HOLY SHIT

correct = 0
computer_number = rand(1..10)
attempts = 3

system("clear")
puts "Guess the number! (Between 1 - 10): 3 Attempts ONLY!"

while (correct == 0)
    puts "Attempts #{attempts}"
    print "Enter Guess: "
    user_guess = gets.chomp.to_i

    if (user_guess != computer_number) and (attempts == 1)
        puts "You have ran out of attempts... Bad Luck, You Lose"
        puts "Play Again? (Yes = y, No = n,)"
        answer = gets.chomp.to_s
        if answer == "y"
            system("clear")
            puts "Guess the number! (Between 1 - 10): 3 Attempts ONLY!"
            attempts = 3
            correct = 0
        elsif answer == "n"
            system("clear")
            puts "Thank you for playing
            "
            correct = 1
        else
        end

    elsif computer_number == user_guess
        puts "You got it!. Congratulations!"
        correct = 1
        puts "Play Again? (Yes = y, No = n)"
        answer = gets.chomp.to_s
        if answer == "y"
            system("clear")
            puts "Guess the number! (Between 1 - 10): 3 Attempts ONLY!"
            attempts = 3
            correct = 0
        elsif answer == "n"
            system("clear")
            puts "Thank you for playing!
            "
        else
        end

    elsif (user_guess > computer_number) and (attempts > 0)
        attempts -= 1
        puts "Too High.. Guess again"

    elsif (user_guess < computer_number) and (attempts > 0)
        attempts -= 1
        puts "Too Low... Guess again"

    elsif (user_guess != computer_number) and (attemps == 0) 
        puts "You have ran out of attempts... Bad Luck, You Lose"
        puts "Play Again? (Yes = y, No = n,"
        if answer == "y"
            attempts = 3
            correct = 0
        elsif answer == "n"
            puts "Thank you for playing"
        else
        end
    end
end
