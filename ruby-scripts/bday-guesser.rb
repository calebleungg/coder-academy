#global variables for storing guess data

@months = ["January" , "Februrary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
@days = Array(1 .. 31)

@total_guesses = [] #array used for collating computer guesses used to determined a new unguessed comination
@continue = 1

@computer_guess = ""

@month_guess = @months[rand(0 .. 11)]
@day_guess = @days[rand(0 .. 30)]

#Function for determining right ordinal indicator for the computer's guess
def st_rd_th()
    if @day_guess < 14
        case @day_guess
        when 1
            "st"
        when 2
            "nd"
        when 3
            "rd"
        else
            "th"
        end
    elsif @day_guess
        case @day_guess.to_s[-1]
        when "1"
            "st"
        when "2"
            "nd"
        when "3"
            "rd"
        else
            "th"
        end
    else
        puts "ERROR"
    end
end

#Function for generating computer's guess of user's birthday
def guess_user_birthday()
    @computer_guess = "#{@month_guess} #{@day_guess}"
    puts "Is your birthday..." 
    sleep 1
    puts ""
    puts @computer_guess + "#{st_rd_th()}?
    " 
    puts "(Yes = y, No = n)"
    answer = gets.chomp.to_s
    if answer == "y"
        system ("clear")
        puts "Your Birthday is #{@computer_guess}#{st_rd_th()}!"
        puts "I guess right!... eventually."
        @continue = 0
        sleep 2
        system("clear")
    elsif answer == "n"
        system("clear")
        @total_guesses.push(@computer_guess)
        @copmuter_guess = ""
        puts "Total Guess Count: #{@total_guesses.length}
        "
        puts "Let me guess again..."
    else
        puts "ERROR"
        continue = 0
    end
end

system("clear")

#Running the script
while @continue == 1 

    if @total_guesses.include?("#{@month_guess} #{@day_guess}") == false
        guess_user_birthday()
    else
        @month_guess = @months[rand(0 .. 11)]
        @day_guess = @days[rand(0 .. 30)]
        guess_user_birthday()
    end
end

    



