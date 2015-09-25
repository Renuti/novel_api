require 'json'
require 'byebug'
require './app/models/recommendation.rb'


puts "Enter an artist name to get recommendations:"
artist = gets.chomp

rec = Recommendation.new(artist)

rec.top_three_recs.each do |a|
  puts "#{a}"
end

#puts {rec.top_three_recs}"
