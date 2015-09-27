require 'httparty'
require 'byebug'

class Artist

  attr_reader :artist

  def initialize(artist)
    @artist = artist
    @response = get_response
  end

  private def get_response
    key = ENV['BANDSINTOWN_KEY']
    HTTParty.get("http://api.bandsintown.com/artists/#{@artist}/events.json?api_version=2.0&app_id=RENUTI")#{key}")
  end

  def artist_name
    @response[0]["artists"][0]["name"]
  end

  def venue_name(item)
    @response[item]["venue"]["name"]
  end

  def venue_city(item)
    @response[item]["venue"]["city"]
  end

  def venue_region(item)
    @response[item]["venue"]["region"]
  end

  def concert_date(item)
    @response[item]["datetime"]
  end

  def venues_all
    if @response != []
      venues = {}
      @response.each_index {|item| venues[venue_name(item)] = venue_city(item)}
      venues
    else
      venues = "There are no upcoming events for this artist."
      venues
    end
  end

  #the above error should work if we stop getting this back from the URL issue:
  #/Users/rutiwajnberg/.rbenv/versions/2.2.2/lib/ruby/2.2.0/uri/rfc3986_parser.rb:66:in `split': bad URI(is not URI?): http://api.bandsintown.com/artists/Spice Girls/events.json?api_version=2.0&app_id=RENUTI (URI::InvalidURIError)

#COMMENT OUT BELOW IF DOESN'T WORK

  # def concert_date
  #   dates = []
  #   (1..10).each do |item|
  #     dates << @response[item]["datetime"]
  #   end
  #   dates
  # end

  # def venues_all
  #   venues = {}
  #   (1..10).each {|item| venues[venue_name(item)] = venue_city(item)}
  #   venues
  # end
  #
  # def venues_dates_all
  #   dates = @response.concert_date
  #   dates_venues = {}
  #   dates.each do |a|
  #     dates_venues[a] = @response.venues_all
  #   end
  #   dates_venues
  # end

end
