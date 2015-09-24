require 'test_helper'
require './app/models/artist.rb'
require 'json'

class Artist
  private def get_response
    file = File.open('test/models/madonna.json') #File.read and below JSON.parse
    JSON.load(file)
  end
end

class ArtistTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  def test_artist_name
    assert_equal "Madonna", Artist.new("Madonna").artist_name
  end

  def test_venue_name
    assert_equal "Wells Fargo Center", Artist.new("Madonna").venue_name(0)
  end

  def test_venue_city
    assert_equal "Philadelphia", Artist.new("Madonna").venue_city(0)
  end

  def test_venue_region
    assert_equal "PA", Artist.new("Madonna").venue_region(0)
  end

  def test_venues_all
    assert Artist.new("Madonna").venues_all.include?("TD Garden")
  end

end
