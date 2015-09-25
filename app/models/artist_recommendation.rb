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
    recommendation_concerts # return the new hash!! YAY!!!!!!
  end

  def return_one_recommendation
    recommendation = @recommendation.top_recommendation #recommendation is now one artist (method from Recommendation class)
    recommendation_concerts = {} #empty hash
    recommendation_concerts[recommendation] = Artist.new(recommendation).venues_all #make the artist name the key in a hash, make the top ten upcoming venues the value of the hash
    recommendation_concerts # return the new hash, which only has one result!! YAY!!!!!!
  end

  #Note: we still have to deal with errors.
  #1) Artist input by user does not exist in TasteKid
  #2) Artist recommendations that come back from TasteKid do not exist in BandsInTown

end
