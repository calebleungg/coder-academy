# class defined for plant used throughout the script
class Plant                     
    attr_accessor :happiness, :hunger, :bug_count, :name, :days_alive, :thirst

    def initialize(name)
        @name = name
        @days_alive = 0
        @happiness = 10
        @hunger = 0
        @bug_count = 0
        @thirst = 0
    end
end


# script initiation asking the user to name and create their plant
system("clear")
puts "------ Virtual Plant Game ------\n\n"
print "Name Your Plant: "
plant = Plant.new(gets.chomp.to_s)


# method for displaying the game's main day menu
def game_ui(plant)
    system("clear")
    puts "------ Virtual Plant Game ------\n\n"
    puts "Your Plant: #{plant.name}     Day: #{plant.days_alive}\n\n"
    puts "You have 1 action per day"
    puts "What would you like to do?
    
    [1] Rename #{plant.name}                    
    [2] Sing to #{plant.name}                   
    [3] Feed #{plant.name}                      
    [4] Water #{plant.name}                  
    [5] Give bug repelent to #{plant.name}

    [6] Continue to next day 

    [x] Quit Game\n\n"
    print "Select: "
end

# method for calculating day end actions done to the plant and displaying a report with potential suggestions
def day_end(plant)
    system("clear")
    continue = true
    plant.happiness -= 2              
    if plant.happiness < 0
        plant.happiness = 0
    end
    plant.bug_count += 1                
    if plant.bug_count < 0
        plant.bug_count = 0
    end
    plant.hunger += 1
    if plant.hunger < 0
        plant.hunger = 0
    end
    plant.thirst += 1
    if plant.thirst < 0
        plant.thirst = 0
    end
    plant.days_alive += 1
    while continue
        system("clear")
        puts "------ Virtual Plant Game ------\n\n"
        puts "Plant Report For Day #{plant.days_alive}
        
    Name: #{plant.name}
    Happiness: #{plant.happiness}
    Hunger: #{plant.hunger}
    Thirst: #{plant.thirst}
    Bug Count: #{plant.bug_count}
    
    To Continue, Press [c].\n\n"

        if plant.happiness < 6
            puts "Your plant is unhappy... quickly sing to #{plant.name} tomorrow!"
        end
        if plant.hunger > 10 
            puts "Your plant is hungry... qucikly feed #{plant.name} tomorrow!"
        end
        if plant.thirst > 10
            puts "Your plant is thirsty... quickly water #{plant.name} tomorrow!"
        end
        if plant.bug_count > 5
            puts "Your plant is dirty with bugs... quickly protect #{plant.name} with repelent tomorrow!"
        end
        print "\nSelect: "
        x = gets.chomp.to_s
        if x == "c"
            continue = false
        end
    end
        
end

# method for renaming the plant
def rename(name, plant)
    plant.name = name
    puts "You've renamed your plant to #{plant.name}"
    sleep 2
end

# method for singing to the plant
def sing(plant)
    plant.happiness += 10
    puts "You sing to #{plant.name}. Happiness Increased by 10!"
    sleep 2
end

# method for feeding the plant
def feed(plant)
    plant.hunger -= 7
    puts "You feed #{plant.name}. Hunger Decreaesed by 7!"
    sleep 2
end

# method for watering the plant
def water(plant)
    plant.thirst -= 7
    puts "You water #{plant.name}. Thirst Decreased by 7!"
    sleep 2
end

# method for spraying bug repelent
def repelent(plant)
    plant.bug_count -= 5
    puts "You protect #{plant.name} with bug repelent. Bug Count Decreased by 5!"
    sleep 2
end


# script for running the game loop
continue = true
while continue  
    game_ui(plant)
    option = gets.chomp.to_s
    case option
    when "1"
        puts "What would you like to rename #{plant.name} to?"
        print "Name: "
        rename(gets.chomp.to_s, plant)
        day_end(plant)
    when "2"
        sing(plant)
        day_end(plant)
    when "3"
        feed(plant)
        day_end(plant)
    when "4"
        water(plant)
        day_end(plant)
    when "5"
        repelent(plant)
        day_end(plant)
    when "6"
        puts "You leave your plant alone today..."
        sleep 2
        day_end(plant)
    when "x"
        system("clear")
        continue = false
    else
    end
end
    


        