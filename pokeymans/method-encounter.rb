def encounter(level, pokeyman, pokeydex, count)
    puts "You hear a russle in the bushes ...\n"
    sleep 1
    puts "A wild Pokeyman appears!!

    [1] - Fight with #{pokeyman.name}
    [2] - Catch
    [3] - Run\n"
    print "\nSelect: "
    option = choose3("1", "2", "3")

    case option
    when "1"
        system("clear")
        game_ui(pokeyman)
        puts "You enter into a fierce fight..."
        sleep 1
        damage = rand(0..5)*level
        puts "#{pokeyman.name} takes #{damage} damage"
        sleep 1
        puts "#{pokeyman.name} attacks again..."
        sleep 2
        puts "#{pokeyman.name} is Victorious!!\n"
        puts "\nBattle Report:
        Exp Gained:     100
        Health Lost:    #{damage}"
        pokeyman.exp += 100
        pokeyman.health -= damage
        puts "Continue [c]"
        choose1("c")
    when "2"
        system("clear")
        game_ui(pokeyman)
        puts "You throw a pokeyball at the wild pokeyman..."
        sleep 1
        puts "Wiggle... Wiggle..."
        sleep 1
        puts "Nice!! Pokeymans Caught!"
        if pokeydex.length == 6
            sleep 1
            puts "Oh no... Your Pokeydex is full (max 6 pokeymans)"
            sleep 1
            puts "We'll have to let this guy go... But we'll record it as a caught for the books!"
            sleep 1
            return count += 1
        end
        puts "Name and add it to your pokeydex."
        print "Enter: "
        catch_pokeyman(gets.chomp.to_s, pokeydex, count)
    when "3"
        puts "You sprint away from the Pokeyman! Back into town..."
        sleep 2
    else
    end

end