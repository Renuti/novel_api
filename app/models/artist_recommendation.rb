require 'httparty'
require 'byebug'

class ArtistRecommendation

  def initialize(artist)
    @recommendation = Recommendation.new(artist)
  end

  def return_recommendations
    recommendations = @recommendation.top_three_recommendations #recommendations is now an array with three artist recs
    recommendation_concerts = {} #empty hash
    recommendations.each do |a| #take each artist from my recommendations array
      recommendation_concerts[a] = Artist.new(a).venues_all #make the artist name the key in a hash, make the top ten upcoming venues the value of the hash
    end
    recommendation_concerts # return the new hash!!
  end

end
