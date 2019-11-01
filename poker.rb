system("clear")

#arrays for card data
@numbers = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
@suite = ["S", "H", "D", "C"]

#used cards storing
@used_cards = []

#storing board
@board_cards = []

#assigning points to hand
royal_flush = 10
straight_flush = 9
four_kind = 8
full_house = 7
flush = 6
straight = 5
three_kind = 4
two_pair = 3
pair = 2
high_card = 1

def deal_card
    card = "#{@numbers[rand(0..12)]}#{@suite[rand(0..3)]}"
    if @used_cards.include?(card) == true
        card = "#{@numbers[rand(0..12)]}#{@suite[rand(0..3)]}"
    else
    end
    @used_cards.push(card)
    card
end

def show_cards(x)
    print x 
    print " "
end

@comphand1 = deal_card
@comphand2 = deal_card

@hand1 = deal_card
@hand2 = deal_card

@card1 = deal_card
@board_cards.push(@card1)
@card2 = deal_card
@board_cards.push(@card2)
@card3 = deal_card
@board_cards.push(@card3)
@card4 = deal_card
@board_cards.push(@card4)
@card5 = deal_card
@board_cards.push(@card5)


print "Player Hand: "
show_cards(@hand1)
show_cards(@hand2)
puts "

"
print "----- "
show_cards(@card1)
show_cards(@card2)
show_cards(@card3)
show_cards(@card4)
show_cards(@card5)
print " -----"
puts " 

"

print "Computer Hand: "
show_cards(@comphand1)
show_cards(@comphand2)

puts "

"



def detect_pair
    @counter = 0
    @board_numbers = []
    # @repeats = {}
    @board_pair = 0
    @hand_pair = 0

    for i in @used_cards      #to collect each cards number 
        if i.length == 3
            @board_numbers.push(i[0..1])
        else
            @board_numbers.push(i[0])
        end
    end

    repeats = Hash.new(0)                               #to collate the value of each card for comparision
    @board_numbers.each{ |key| repeats[key] += 1}       # When you create a new hash using Hash.new(x) and assing a
                                                        # value inside the bracket ie. 'x' in this case
                                                        # x will become a default value assigned to and keys placed into the hash

    for key, value in repeats                           #to identify if there are any repeats with the gathered card values                
        if value > 1
            @board_pair = 1                     #use repeats and used_cards to identify
        end
    end
    p @used_cards
    p @board_numbers
    puts repeats

    for key, value in repeats
        if value >= 2
            if key == @hand1[0] or key == @hand2[0]
                puts "Player #{key} Pair"
            elsif key == @comphand1[0] or key == @comphand2[0]
                puts "Computer #{key} Pair"
            else
                puts "Board #{key} Pair"
            end
        else
        end
        
    end

end

detect_pair