require 'httparty'
require 'byebug'

class ArtistRecommendation

  def initialize(artist)
    @recommendation = Recommendation.new(artist)
  end

  def return_recommendations
    recommendations = @recommendation.top_three_recs #recommendations is now an array with three artist recs
    everything = {} #empty hash
    recommendations.each do |a| #take each artist from my recommendations array
      everything[a] = Artist.new(a).venues_all #make the artist name the key in a hash, make the top ten upcoming venues the value of the hash
    end
    everything # return the new hash!!
  end

end
