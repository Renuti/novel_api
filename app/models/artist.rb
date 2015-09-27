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
byebug

  def venue_city(item)
    @response[item]["venue"]["city"]
  end
byebug

  def venue_region(item)
    @response[item]["venue"]["region"]
  end

  def concert_date(item)
    @response[item]["datetime"]
  end

  def venues_all
    venues = {}
    (@response["venue"]).each {|item| venues[venue_name(item)] = venue_city(item)}
    venues
  end

#COMMENT OUT BELOW IF DOESN'T WORK

  def concert_date
    dates = []
    (1..10).each do |item|
      dates << @response[item]["datetime"]
    end
    dates
  end

  # def venues_all
  #   venues = {}
  #   (1..10).each {|item| venues[venue_name(item)] = venue_city(item)}
  #   venues
  # end
  #
  def venues_dates_all
    dates = @response.concert_date
    dates_venues = {}
    dates.each do |a|
      dates_venues[a] = @response.venues_all
    end
    dates_venues
  end

end
