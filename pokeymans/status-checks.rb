
# function for checking a pokeyman's hunger and applicable changes
def hunger_check(pokeyman)
    if pokeyman.hunger > 30
        puts "\n#{pokeyman.name} hasnt eating in ages! He's getting sick (HP - 10)"
        puts "Quickly feed #{pokeyman.name}\n"
        pokeyman.health -= 10
        sleep 2
    end
end

# function for checking a pokeyman's hp and applicable changes if dead
def hp_check(pokeyman, pokeydex)
    if pokeyman.health <= 0 
        puts "\nOh no #{pokeyman.name} has run out of health..."
        puts "#{pokeyman.name} has died..."
        sleep 2
        system("clear")
        puts "------ Pokeyman ------"
        puts "\nFinal Report for #{pokeyman.name}"
        puts "\nLevel Achieved:               #{pokeyman.lvl}"
        puts "Total Experience Achieved:    #{pokeyman.exp}\n"
        pokeydex.delete(pokeyman)
        puts "Continue [c]"
        option = choose1("c")
        if "c"
            return false
        end
    end
    true
end