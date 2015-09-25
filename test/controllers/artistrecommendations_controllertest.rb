require 'test_helper'

class ArtistRecommendationsControllerTest < ActionController::TestCase

def test_show_one_recommendation
  get :show, artist: params(:artist)
  assert_response :success

  assert response.body.include?("Ruti")
end
