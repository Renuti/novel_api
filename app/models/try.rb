require 'json'
require 'byebug'
require './recommendation.rb'
require './artist_recommendation.rb'


puts "Enter an artist name:"
artist = gets.chomp

# recommendations = Recommendation.new(artist)
recommendations = ArtistRecommendation.new(artist)

puts "#{recommendations.return_recommendations}" "\n"
puts "#{recommendations.return_one_recommendation}" "\n"


# puts "#{recommendations.recommend_type}"
# puts "#{recommendations.get_type}"
