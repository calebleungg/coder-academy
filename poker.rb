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
        @used_cards.push(card)
    end

    card
end

def show_cards(x)
    print x 
    print " "
    sleep 0.5
end

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

show_cards(@hand1)
show_cards(@hand2)
puts "

"

show_cards(@card1)
show_cards(@card2)
show_cards(@card3)
show_cards(@card4)
show_cards(@card5)
puts " "


def detect_pair
    @counter = 0
    @board_numbers = []
    # @repeats = {}
    @board_pair = 0

    for i in @board_cards       #to collect each cards number 
        if i.length == 3
            @board_numbers.push(i[0..1])
        else
            @board_numbers.push(i[0])
        end
    end

    repeats = Hash.new(0)                               #to collate the value of each card for comparision
    @board_numbers.each{ |e| repeats[e] += 1}           #why does this work?

    for key, value in repeats                           #to identify if there are any repeats with the gathered card values                
        if value > 1
            @board_pair = 1
        end
    end

    if @hand1[0] == @hand2[0]           #identifying a pair in players hand
        @counter += 1
    else
    end

    for i in @board_cards       #to identify pairs/triples/quads comparying players hand to board

        if i[0] == @hand1[0] || i[0] == @hand2[0]
            @counter += 1
        end

    end

    case @counter                       #printing out right identifyer for hand board combo
    when 1
        puts "Pair"
    when 2
        if (@hand1[0] != @hand2[0]) and (@board_pair == 1)
            puts "Triple"
        elsif @hand1[0] != @hand2[0]
            puts "Two Pair"
        end
    when 3
        puts "Quad"
    else
        high_card = []
        high_card.push(@hand1[0])
        high_card.push(@hand2[0])
        puts "High Card Hand of: #{high_card.sort[-1]}"
    end

end

detect_pair