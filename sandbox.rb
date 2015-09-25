require 'httparty'
require 'byebug'
#require './app/models/recommendation.rb'
require './app/models/artist.rb'

puts "Enter an artist:"
artist = gets.chomp

api = Artist.new(artist)

puts "The artist whose events you are seeking is #{api.artist_name}."
puts ""
puts "The venue for the next upcoming show is #{api.venue_name(0)}, located in #{api.venue_city(0)}, #{api.venue_region(0)} on #{api.concert_date(0)}."
puts ""
puts "The artist's next 10 shows are at the following venues:"
puts ""
api.venues_all.each do |k, v|
  puts "#{k} in #{v}"
end

#COMMENT OUT BELOW IF DOESN'T WORK

# puts "The dates are #{api.concert_date}."
# puts ""
# api.venues_all.each do |k, v|
#   puts "#{k} in #{v}"
# end
# puts ""
# puts "#{api.venues_dates_all}"
