require 'httparty'
require 'byebug'

class Recommendation

  def initialize(artist)
    @artist = artist
    @response = get_response
  end

  private def get_response
    key = ENV['TASTEKID_KEY']
    HTTParty.get("https://www.tastekid.com/api/#{key}/similar?q=#{@artist}&verbose=1&output=json")
  end

  def get_recommendation
    @response["Similar"]["Results"][1]["Name"]
    @response["Similar"]["Results"][1]["Type"]
  end

end
