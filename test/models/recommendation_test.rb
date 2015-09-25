require 'test_helper'
require 'json'

class Recommendation
  private def get_response
    file = File.read("spicegirls.json")
    JSON.parse(file)
  end
end

class RecommendationTest < ActiveSupport::TestCase

  # def test_recs_work
  #   assert RecommendationTest.new("Spice Girls")include?(name:"Atomic Kitten", type: "music")
  # end

  def test_recs_work
    assert Recommendation.new("Spice Girls").top_three_recs.include?("Atomic Kitten")
  end

end
