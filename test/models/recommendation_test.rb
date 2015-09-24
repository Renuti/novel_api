require 'test_helper'

class Recommendation
  private def get_response
    file = File.read("spicegirls.json")
    hash = JSON.parse(file)
  end
end

class RecommendationTest < ActiveSupport::TestCase
  def "test recs work"
    assert RecommendationTest.new("Spice Girls")include?(name:"Atomic Kitten", type: "music")
  end
end
