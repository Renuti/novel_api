require 'json'
require 'byebug'
require './recommendation.rb'


puts "Enter an artist name:"
artist = gets.chomp

recommendations = Recommendation.new(artist)

puts "#{recommendations.get_recommendation}"
