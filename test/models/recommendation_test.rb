require 'test_helper'

class Recommendation
  private def get_response
    file = File.read("spicegirls.json")
    hash = JSON.parse(file)
  end
end

class RecommendationTest < ActiveSupport::TestCase

 test "test recs work" do
    assert RecommendationTest.new("Spice Girls").recommend_artist.include?("Atomic Kitten")
  end

end
