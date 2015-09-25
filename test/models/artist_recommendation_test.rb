require 'test_helper'
require './app/models/recommendation.rb'
require './app/models/artist.rb'
require './app/models/artist_recommendation.rb'
require 'json'

class ArtistRecommendation
  private def get_response
    file = File.open('test/models/spicegirls.json') # NEED TO FIND FILE WITH SHARED RETURNED RESULTS
    JSON.load(file)
    file = File.open('test/models/madonna.json') # NEED TO FIND FILE WITH SHARED RETURNED RESULTS
    JSON.load(file)
  end
end

class RecommendationTest < ActiveSupport::TestCase

  def test_return_recommendations
    assert Recommendation.new("Spice Girls").return_recommendations.include?("Atomic Kitten") #need to reflect new stubbed JSON files
    assert Recommendation.new("Spice Girls").return_recommendations.include?("Atomic Kitten") #need to reflect new stubbed JSON files
  end

end
