require 'httparty'
require 'byebug'

class Recommendation 

  def initialize(content)
    @content = content
    @response = get_response
  end

  private def get_response
    key = ENV['TASTEKID_KEY']
    HTTParty.get("https://www.tastekid.com/api/#{key}/similar?q=#{content}&verbose=1")
  end

  def get_recommendation
    @response["Similar"]["Info"]["name"]
    @response["Similar"]["Info"]["type"]
  end

end
