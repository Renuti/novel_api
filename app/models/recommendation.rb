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
    if @response["Similar"]["Info"]["Type"] != "unknown"
      artists = []
      (1..3).each do |item|
        artists << @response["Similar"]["Results"][item]["Name"]
      end
      artists
    else
      artists = "This artist is unknown."
      artists
    end
  end

  def top_recommendation
    if @response["Similar"]["Info"]["Type"] != "unknown"
      @response["Similar"]["Results"][1]["Name"]
    else
      artists = "This artist is unknown."
      artists
    end
  end

end
# #test:
# puts "Artist Name:"
# artist = gets.chomp
# rec = Recommendation.new(artist)
# puts rec.top_three_recommendations

#ALL WORKING CODE
