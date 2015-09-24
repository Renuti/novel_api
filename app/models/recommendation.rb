require 'httparty'
require 'byebug'
require './app/models/artist.rb'

class Recommendation

  def initialize(content)
    @content = content
    @response = get_response
  end

  private def get_response
    key = ENV['TASTEKID_KEY']
    HTTParty.get("https://www.tastekid.com/api/#{key}/similar?q=#{@content}&verbose=1")
  end

  def get_recommendation
    byebug
    @response["Similar"]["Results"][0]["Name"]
  end

end
