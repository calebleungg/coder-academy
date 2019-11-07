require "./class-pokeyman"
require "./method-train"
require "./method-care"
require "./status-checks"
require "./method-encounter"

catch_count = 1
pokeydex = []


def game_ui(pokeyman)
    system("clear")
    puts "------ Pokeymans ------\n\n"
    puts "Pokeyman:     #{pokeyman.name}\n\n"
    puts "Health:       #{pokeyman.health}/#{pokeyman.max_health}              Happiness:  #{pokeyman.happiness}"
    puts "Level:        #{pokeyman.lvl}                  Hunger:     #{pokeyman.hunger}"
    puts "Experience:   #{pokeyman.exp}"
    puts "------------------------"
end

def options_menu()
    puts "\nChoose 1 Action
    
    [1] Train                   
    [2] Adventure                  
    [3] Take Care   

    [4] Pokeydex                   

    [x] Quit\n\n"
    print "Select: "
end

def catch_pokeyman(name, pokeydex, catch_count)
    new_pokeyman = Pokeyman.new(name)
    pokeydex.push(new_pokeyman)
    return catch_count += 1
end

system("clear")
puts "Welcome to Pokeyman\n\n"
print "Please enter a name for your first Pokeyman: "
catch_pokeyman(gets.chomp.to_s, pokeydex, catch_count)

choose_pokeyman = true
while choose_pokeyman

    if pokeydex.length <= 0 
        puts "You have run out of pokeyman... you lose!"
        sleep 2
        choose_pokeyman = false
    end

    system("clear")
    puts "------ Pokeydex ------ "
    puts "Total Caught: #{catch_count}"
    puts "----------------------\n\n"
    x = 1
    for i in pokeydex
        puts "[#{x}] - #{i.name}"
        x += 1
    end
    print "\nChoose Pokeman: "
    chosen = gets.chomp.to_i - 1

    continue = true
    while continue  
        game_ui(pokeydex[chosen])
        options_menu()
        option = gets.chomp.to_s
        case option
        when "1"
            train(pokeydex[chosen], 20)
            hunger_check(pokeydex[chosen])
            continue = hp_check(pokeydex[chosen], pokeydex)
            encounter(5, pokeydex[chosen], pokeydex, catch_count)
            continue = hp_check(pokeydex[chosen], pokeydex)
        when "2"
            system("clear")
            game_ui(pokeydex[chosen])
            puts "You go adventuring in the tall wild grass..."
            sleep 1
            encounter(5, pokeydex[chosen], pokeydex, catch_count)
            continue = hp_check(pokeydex[chosen], pokeydex)
        when "3"
            care(pokeydex[chosen])
            hunger_check(pokeydex[chosen])
            continue = hp_check(pokeydex[chosen], pokeydex)
            system("clear")
            game_ui(pokeydex[chosen])
            encounter(5, pokeydex[chosen], pokeydex, catch_count)
            continue = hp_check(pokeydex[chosen], pokeydex)
        when "4"
            system("clear")
            continue = false
        when "x"
            system("clear")
            continue = false
            choose_pokeyman = false
        else
        end

        if pokeydex.length <= 0 
            continue = false
        end

        system("clear")
        game_ui(pokeydex[chosen])
        exp_check(pokeydex[chosen])
    end
end

