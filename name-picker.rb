students = ["John", "Luke", "Picard", "Benjamin", "Sisko", "Kate", "Jane"] 
picked = []


def pick(students, picked)

    no_of_students = students.length
    pick = students[rand(0..(students.length - 1))]
    until picked.include?(pick) == false
        pick = students[rand(0..(students.length - 1))]
    end

    picked.push(pick)
    return pick
    
end

picking = true

while picking

    if picked.length == students.length
        puts "Done!"
        picking = false
        return
    end

    puts "\n~~~~~ #{pick(students, picked)} ~~~~~"
    puts "\nPress Enter to pick again"
    gets
end
