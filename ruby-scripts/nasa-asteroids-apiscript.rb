require "httparty"

puts "\nNASA - Mission Report"
puts "---\n"

print "\nEnter Date (YYYY-MM-DD): "
date = gets.chomp.to_s

response = HTTParty.get("https://api.nasa.gov/neo/rest/v1/feed?start_date=#{date}&end_date=#{date}&api_key=PTejo89NiqIDQMY8Wwx3axFf1bRqx1muZptEQY0O")
data = JSON.parse(response.body)


puts "Total Near Earth Objects #{data["element_count"]}"


puts "\n-------------------------------------------"
puts "Near earth objects detected on #{date}"
puts "-------------------------------------------"

for asteroid in data["near_earth_objects"][date]
    puts "Name: #{asteroid["name"]}"
    puts "ID: #{asteroid["id"]}"
    puts "---"
end
