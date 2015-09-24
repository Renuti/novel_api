require 'httparty'
require 'byebug'

class Artist

  def initialize(artist)
    @artist = artist
    @response = get_response
  end

  private def get_response
    key = ENV['BANDSINTOWN_KEY']
    HTTParty.get("http://api.bandsintown.com/artists/#{@artist}/events.json?api_version=2.0&app_id=renuti")#{key}")
  end

  def artist_name
    @response[0]["artists"][0]["name"]
  end

  def venue_name
    @response[0]["venue"]["name"]
  end

  def venue_city
    @response[0]["venue"]["city"]
  end

  def venue_region  
    @response[0]["venue"]["region"]
  end

end
