#------------------------ Menu Sequence ------------------------ 

def choose_game()
    puts "               -------- Ruby Games --------
    "
    puts "Lucky Dice = Dice\nGuess My Number = Guess\nTimer = Timer\nScissors-Paper-Rock = Spr\n \nTo Quit, Type Exit \n \n"
    print "Select Game: "
    game_choice = gets.chomp.to_s.capitalize

    case game_choice
    when "Dice"
        system("clear")
        dice_game()
        system("clear")
        choose_game()
    when "Timer"
        system("clear")
        timer_game()
        system("clear")
        choose_game()
    when "Guess"
        system("clear")
        guessing_game()
        system("clear")
        choose_game()
    when "Spr"
        system("clear")
        spr_game()
        system("clear")
        choose_game()
    when "Exit"
        system("clear")
        puts "                           -------- Ruby Games --------
    "
        puts "Thank you for playing.
        "
        sleep 1
        system("clear")
    else 
        system("clear")
        puts "ERROR: Please enter an appropriate option
        "
        choose_game()
    end
end

#------------------------ Taking back to main menu function ------------------------ 

def main_menu()
    system("clear")
    puts "Taking you back to main menu... (~2 seconds)
    "
    sleep 2
end

#------------------------ Dice Game ------------------------ 
def dice_game()
    dice1 = 0
    dice2 = 0
    play_again = "y"

    while play_again == "y" do
        dice1 = rand(1..6)
        dice2 = rand(1..6)
        
        system("clear")
        puts "Dice Game Start...
        "
        sleep 1
        puts "Dice One Rolled... #{dice1}"
        sleep 1
        puts "Dice Two Rolled... #{dice2}
        "

        if (dice1 + dice2) == 7
            puts "Lucky 7!!
            "
        elsif dice1 == 1 and dice2 == 1
            puts "SNAKE EYES!!!
            "
        elsif dice1 == dice2
            puts "You Win
            "
        else
            puts "You Lose.
            "
        end
        puts "Play Again? (Yes = y, No = n)"
        play_again = gets.chomp.to_s
    end
    
    main_menu()
end


    #------------------------ Timer ------------------------ 


def timer_game()
    play_again = "y"

    while play_again == "y"
        system("clear")
        puts "How many seconds do you want to set the timer?"
        countdown = gets.chomp.to_i
        system("clear")
        puts "Timer: #{countdown}"

        until countdown == 0
            countdown -= 1
            sleep 1
            system("clear")
            puts "Timer: #{countdown}"
        end
        system("clear")
        puts "Timer: Finished"

        puts "Start Timer Again? (Yes = y, No = n)"
        play_again = gets.chomp.to_s
    end

    main_menu()

end


    #------------------------ Guessing Game ------------------------ 
def guessing_game()
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
                computer_number = rand(1..10)
            elsif answer == "n"
                correct = 1
                main_menu()
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
                computer_number = rand(1..10)
            elsif answer == "n"
                main_menu()
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
                computer_number = rand(1..10)
            elsif answer == "n"
                main_menu()
            else
            end
        end
    end
end



    #------------------------ Scissors Paper Rock ------------------------ 

def spr_game()
    @name_1 = ""
    @name_2 = ""

    @p1_score = 0
    @p2_score = 0
    @comp_score = 0




    #function for displaying header scoreboard
    def display_score()
        system("clear")
        if @game_type == "C"
            @name_1 = "Computer"
            score_1 = @comp_score
            score_2 = @p1_score
        elsif @game_type == "F"
            score_1 = @p1_score
            score_2 = @p2_score
        else
            puts "ERROR"
        end
        puts "                    --- Scoreboard --- "
        puts "               #{@name_1}: #{score_1} || #{@name_2}: #{score_2}" 
    end

    #Player 1 win scenario
    def p1_wins()

        display_score()
        puts "Loading Result...."
        sleep 1

        case @game_type
        when "C"
            @comp_score += 1
            display_score()
            puts "#{@name_1} Wins!"
        when "F"
            @p1_score += 1
            display_score()
            puts "#{@name_1} Wins!"
        else
        end
    end

    #Player 2 win scenario
    def p2_wins()

        display_score()
        puts "Loading Result...."
        sleep 1

        case @game_type
        when "C"
            @p1_score += 1
            display_score()
            puts "#{@name_2} Wins!"
        when "F"
            @p2_score += 1
            display_score()
            puts "#{@name_2} Wins!"
        else
        end
    end


    #function for running the game
    def run_game()

        display_score()

        case @game_type
        when "C"
            moves = ["r", "s", "p"]
            p1 = moves[rand(0..2)]

            puts "Computer is choosing his weapon..."
            sleep 1
            puts "Ok, your turn. "
        when "F"
            puts "#{@name_1}: Enter Move (rock = r, paper = p, scissors = s)"
            p1 = gets.chomp
            display_score()
        else
        end

        puts "#{@name_2}: Enter Move (rock = r, paper = p, scissors = s)"
        p2 = gets.chomp

        system("clear")
        if p1 == p2 
            display_score()
            puts "Tie! "
            play_again_question()
        elsif p1 == "r" and p2 == "s"
            p1_wins()
            play_again_question()
        elsif p1 == "r" and p2 == "p"
            p2_wins()
            play_again_question()
        elsif p1 == "p" and p2 == "r"
            p1_wins()
            play_again_question()
        elsif p1 == "p" and p2 =="s"
            p2_wins()
            play_again_question()
        elsif p1 == "s" and p2 == "r"
            p2_wins()
            play_again_question()
        elsif p1 == "s" and p2 == "p"
            p1_wins()
            play_again_question()
        else 
            puts "Pick again"
        end

    end

    #function continuing the game/exiting the game
    def play_again_question()

        t1 = 0
        t2 = 0 

        case @game_type
        when "C"
            t1 = @comp_score
            t2 = @p1_score
        when "F"
            t1 = @p1_score
            t2 = @p2_score
        else
        end

        puts "Play Again? (Yes = y, No = n)"

        play_again = gets.chomp.to_s

        case play_again
        when "n"
            display_score()
            puts""
            if t1 > t2
                puts "#{@name_1} WINS OVERALL!!!"
            elsif t2 > t1
                puts "#{@name_2} WINS OVERALL!!!"
            else
                puts "ITS AN OVERALL TIE!!!"
            end

            puts "\nThank you for playing!\n"
            sleep 1.5
            system("clear")
        when "y"
            system("clear")
            display_score()
            run_game()
        else
            puts "ERROR"
        end
    end


    #running the script
    system("clear")
    puts "            ~~Play! Scissors Paper Rock~~

    "
    puts "               Would you like to vs..."
    puts "-----Computer = C ----- OR ----- Friend = F -----

    "
    print "Select Option: "
    @game_type = gets.chomp.to_s.upcase

    case @game_type
    when "C"
        print "Enter Player Name: "
        @name_2 = gets.chomp.to_s
    when "F"
        puts "Player 1, enter name: "
        @name_1 = gets.chomp.to_s
        puts "Player 2, enter name: "
        @name_2 = gets.chomp.to_s
    else
    end

    display_score()
    run_game()

end


    #------------------------ Start Programn ------------------------ 
system("clear")
choose_game()
