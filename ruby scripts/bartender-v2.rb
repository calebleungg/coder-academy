@cocktail = 3
@water = 2
@beer = 6
@wine = 1
@chocolate = 8
@coffee = 4
@cake = 12

profit_cocktail = 22.00 - 8.00
profit_beer = 12.00 - 3.00
profit_water = 6.00 - 0.15
profit_wine = 25.00 - 5.00
profit_chocolate = 7.00 - 2.00
profit_coffee = 5.50 - 1.00
profit_cake = 9.00 - 3.00



def get_order(item)
   case item.downcase
   when "cocktail"
    @cocktail += 1
   when "water"
    @water += 1
   when "beer"
    @beer += 1
   when "wine"
    @wine += 1
   when "chocolate"
    @chocolate += 1
   when "coffee"
    @coffee += 1
   when "cake"
    @cake += 1
   else
    puts "Sorry we dont have that. Please pick something from the menu."
    get_order(gets.chomp)
   end
end


puts "What would you like to order?
Menu: beer, water, cocktail, wine, chocolate, coffee, cake"
get_order(gets.chomp)

puts "
Orders Pending: 
Cocktails: #{@cocktail} Waters: #{@water} Beers: #{@beer} Wine: #{@wine} Chocolate: #{@chocolate} Coffee: #{@coffee} Cake: #{@cake}

Total Profit:"
puts "$" + ((profit_cocktail * @cocktail) + (profit_beer * @beer) + (profit_water * @water)
+ (profit_wine * @wine) + (profit_chocolate * @chocolate) + (profit_coffee * @coffee) + (profit_cake * @cake)).to_s