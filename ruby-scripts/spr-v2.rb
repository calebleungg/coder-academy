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
