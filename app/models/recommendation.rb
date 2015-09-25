require 'httparty'
require 'byebug'
# require './app/models/artist.rb'

class Recommendation

  def initialize(artist)
    @artist = artist
    @response = get_response
  end

  private def get_response
    key = ENV['TASTEKID_KEY']
    HTTParty.get("https://www.tastekid.com/api/#{key}/similar?q=#{@artist}&verbose=1&output=json")
  end

  def top_three_recommendations
    artists = []
    (1..3).each do |item|
      artists << @response["Similar"]["Results"][item]["Name"]
    end
    artists
  end

end
