require 'test_helper'
require './app/models/recommendation.rb'
require 'json'

class Recommendation
  private def get_response
    file = File.open('test/models/spicegirls.json')
    JSON.load(file)
  end
end

class RecommendationTest < ActiveSupport::TestCase

  def test_recs_work
    assert Recommendation.new("Spice Girls").top_three_recommendations.include?("Atomic Kitten")
  end

end
