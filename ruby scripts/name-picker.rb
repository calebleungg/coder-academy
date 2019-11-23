students = ["John", "Luke", "Picard", "Benjamin", "Sisko", "Kate", "Jane"] 

until students.length == 0
    
    puts "\n~~**<<|| #{students.shuffle!.slice!(0)} ||>>**~~"
    puts "\nPress Enter to pick again"
    gets
end

# random pick of names while deleting from original array
