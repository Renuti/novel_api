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

  def rec_artist
    artists = []
    (1..3).each do |a|
      artists << @response["Similar"]["Results"][a]["Name"]
    end
    artists
  end

  # def recommend_type
  #   @response["Similar"]["Results"][a]["Type"]
  # end

end
