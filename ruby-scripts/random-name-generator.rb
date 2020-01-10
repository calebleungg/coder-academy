def enter_name(names)
    print "\nEnter Name: "
    names.push(gets.chomp.to_s)
end

def pick_name(names)
    names.shuffle 
    return names[0]
end

entering = true
names = []

while entering 
    system("clear")
    puts "----- Random Name Generator -----\n"
    puts "\nList: #{names}"
    
    enter_name(names)
    
    puts "\nEnter another? [Y]es [F]inish"

    choice = gets.chomp.to_s
    case choice.downcase
    when "y"
        entering = true
    when "f"
        entering = false
    end

end

until names.length == 0
    system("clear")
    puts "Next is...."
    sleep 1

    puts "\n-------------"
    puts pick_name(names)
    puts "-------------"

    puts "\nPress Enter for next name.."
    gets
end

puts "Finished!"







