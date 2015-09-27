require 'httparty'
require 'byebug'

class ArtistRecommendation

  private def get_response
    key = ENV['BANDSINTOWN_KEY']
    HTTParty.get("http://api.bandsintown.com/artists/#{@artist}/events.json?api_version=2.0&app_id=renuti")#{key}")
  end

  def initialize(artist)
    @artist = artist
    @recommendation = Recommendation.new(artist)
  end

  def return_recommendations
    recommendations = @recommendation.top_three_recommendations #recommendations is now an array with three artist recs
    recommendation_concerts = {} #empty hash
    recommendations.each do |a| #take each artist from my recommendations array
      recommendation_concerts[a] = Artist.new(a).venues_all #make the artist name the key in a hash, make the top ten upcoming venues the value of the hash
    end
    recommendation_concerts # return the new hash!! YAY!!!!!!
  end
  # def return_one_recommendation
  #   @recommendation = @response.top_recommendation #recommendation is now one artist (method from Recommendation class)
  #   recommendation_concerts = {} #empty hash
  #   recommendation_concerts[recommendation] = Artist.new(recommendation).venues_all #make the artist name the key in a hash, make the top ten upcoming venues the value of the hash
  #   recommendation_concerts # return the new hash, which only has one result!! YAY!!!!!!
  # end

end

#test:
puts "Artist Name:"
 artist = gets.chomp

 puts artist.return_recommendations
