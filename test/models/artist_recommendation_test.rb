require 'test_helper'
require './app/models/recommendation.rb'
require './app/models/artist.rb'
require './app/models/artist_recommendation.rb'
require 'json'

class ArtistRecommendation
  private def get_response
    file = File.open('test/models/flaminglips.json') # Saved this file because it spits back Wilco as a recommendation
    file = File.open('test/models/wilco.json') # Saved this file because Wilco has upcoming events in BandsInTown
    JSON.load(file)
  end
end

class RecommendationTest < ActiveSupport::TestCase

  def test_return_recommendations
    assert Recommendation.new("Flaming Lips").return_recommendations.include?("Wilco") #should reflect Wilco as one of top three recommendations
    assert Recommendation.new("Flaming Lips").return_recommendations.include?("IU Auditorium") #should reflect this venue as one of the upcoming ten
  end

end
