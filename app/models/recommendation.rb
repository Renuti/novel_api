require 'httparty'
require 'byebug'

class Recommendation

  def initialize(artist)
    @artist = artist
    @response = get_response
  end

  private def get_response
    key = ENV['TASTEKID_KEY']
    HTTParty.get("https://www.tastekid.com/api/#{key}/similar?q=#{@artist}&output=json")
  end

  def get_recommendation
    @response["Similar"]["Results"][0]["Name"]
    byebug
    @response["Similar"]["Results"][0]["Type"]
  end

end
