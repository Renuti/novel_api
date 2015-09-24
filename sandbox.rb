require 'httparty'
require 'byebug'
# require './app/models/recommendation.rb'
require './app/models/artist.rb'

puts "Enter an artist:"
artist = gets.chomp

api = Artist.new(artist)
puts "The artist whose events you are seeking is #{api.artist_name}."
puts ""
puts "The venue for the next upcoming show is #{api.venue_name(0)}, located in #{api.venue_city(0)}, #{api.venue_region(0)}."
puts ""
puts "The artist is performing at the following venues:"
puts ""
api.venues_all.each do |k, v|
  puts "#{k} in #{v}"
end
   #{api.venues_all}."
# api = Condition.new(zip_code)
# puts "The current weather is #{api.weather}."
# puts "The current temperature is #{api.temperature} degrees Fahrenheit."
# puts "The current relative humidity is #{api.humidity}."
# puts ""
#
# api2 = Forecast.new(zip_code)
# puts "The weather over the next ten days is:"
# api2.forecast_text_all.each do |k, v|
#   puts "#{k}: #{v}"
# end
# puts ""
#
# api3 = Sun.new(zip_code)
# puts "The sunrise is at #{api3.sunrise_time}."
# puts "The sunset is at #{api3.sunset_time}."
# puts ""
#
# api4 = Alert.new(zip_code)
# puts "Current status of weather alerts:"
# puts api4.current_alert
# puts ""
#
# api5 = Hurricane.new
# puts "Currently active hurricanes:"
# puts api5.current_hurricane
