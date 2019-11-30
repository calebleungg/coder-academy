words = [
    "correct", "horse", "battery", 
    "staple", "turtle", "blue", 
    "noisy", "hungry", "extra", 
    "speedy", "coding", "website", 
    "banana", "seal", "zebra", "flag"
]

password = []

def generate_word(data_base)
    word = data_base[rand(0..15)].capitalize
    return word
end

def generate_number(min, max)
    number = rand(min..max)
    return number.to_s
end

def regenerate(password, word, data_base)
    number = word[-1].to_i - 1
    password[number] = generate_word(data_base)
end

def print_password(password)
    for i in password do
        print i
    end
end

continue = 1

system("clear")

puts "Random Password: 

"
password = 4.times.collect {generate_word(words)}
number = generate_number(1,999)

print_password(password)

print number
puts " 

"

while continue == 1
    puts "You can regenerate a specific word by typing: 'regenerate(1..4)'"
    regenerate(password, gets.chomp.to_s, words)
    system("clear")

    puts "Random Password: 
    "
    print_password(password)
    print number
    puts "
    "

end


