# function for caring for pokeyman
def care(pokeyman)

    #running care loop
    continue = true 
    while continue
        system("clear")
        game_ui(pokeyman)
        puts "\nChoose 1 Action
        
    [1] Play with #{pokeyman.name}                   
    [2] Feed #{pokeyman.name}     
    [3] Recover #{pokeyman.name}                                 

    [b] Back\n\n"
    print "Select: "
        option = gets.chomp.to_s
        case option
        when "b"
            return
        when "1"
            pokeyman.happiness += 30
            puts "You play with #{pokeyman.name}: Happiness +30"
            sleep 2
            pokeyman.hunger += 2
            continue = false
        when "2"
            pokeyman.hunger -= 20
            if pokeyman.hunger < 0
                pokeyman.hunger = 0
            end
            puts "You feed #{pokeyman.name}: Hunger -20"
            sleep 2
            continue = false
        when "3"
            pokeyman.health = pokeyman.max_health
            puts "You take #{pokeyman.name} to recover at the nurse: Health +FULL"
            sleep 2
            continue = false
        else
        end
    end
end