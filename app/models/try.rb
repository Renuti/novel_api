require 'json'
require 'byebug'
require './recommendation.rb'


puts "Enter an artist name:"
artist = gets.chomp

recommendations = Recommendation.new(artist)

puts "#{recommendations.rec_artist}" "\n"

# puts "#{recommendations.recommend_type}"
# puts "#{recommendations.get_type}"
