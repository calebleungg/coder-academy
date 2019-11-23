# following choose option functions are used to handle user error inputs at decision points
def choose1(option1)
    user_input = gets.chomp
    until (user_input == option1)
        p option1
        puts "Input Error: Enter [#{option1}]"
        user_input = gets.chomp
    end
    return user_input
end

def choose2(option1, option2)
    user_input = gets.chomp
    until (user_input == option1) || (user_input == option2)
        puts "Input Error: Enter [#{option1}] or [#{option2}]"
        user_input = gets.chomp
    end
    return user_input
end

def choose3(option1, option2, option3)
    user_input = gets.chomp
    until (user_input == option1) || (user_input == option2) || (user_input == option3)
        puts "Input Error: Enter [#{option1}] or [#{option2}] or [#{option3}]"
        user_input = gets.chomp
    end
    return user_input
end

# functino for checking exp and applicable level up
def exp_check(pokeyman)
    system("clear")
    game_ui(pokeyman)
    for key, value in pokeyman.lvl_caps                 # level caps is a hash stored in the pokeyman-class
        if pokeyman.exp >= key
            pokeyman.max_health += value[:hp_up]
            pokeyman.lvl += 1
            pokeyman.lvl_caps.delete(key)
            puts "\nCongratulations!! #{pokeyman.name} has leveled up!"
            puts "+ Level #{pokeyman.lvl}"
            puts "+ #{value[:hp_up]} HP"
            puts "\n [c] Continue"
            choose2("c", "c")
        end
    end
end

# function for training pokeyman 
def train(pokeyman, amount)
    system("clear")
    game_ui(pokeyman)
    if pokeyman.happiness <= 0              #if statement for checking if there is enough happiness to train 
        puts "Larry refuses to train... (Happiness at 0)"
        sleep 2
        return continue = true
    end
    
    pokeyman.exp += amount
    pokeyman.happiness -= 5                 #applying decrease in happiness after training
    if pokeyman.happiness < 0                     
        pokeyman.happines = 0
    end
    
    puts "You train intensly with #{pokeyman.name}..."
    sleep 1
    puts "#{pokeyman.name}'s Stats have increased!

    EXP + #{amount}
    Happiness - 20"
    puts "\nTotal Experience: #{pokeyman.exp}"
    puts "To Continue [c]"
    choose1("c")
    exp_check(pokeyman)
    pokeyman.hunger += 4                    # applying hunger decrease after training
end