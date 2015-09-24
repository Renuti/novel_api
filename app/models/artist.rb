require 'httparty'
require 'byebug'

class Artist < ActiveRecord::Base

  def initialize(show)
    @artist = artist
    @response = get_response
  end

  private def get_response
    key = ENV['BANDSINTOWN_KEY']
    HTTParty.get("http://api.bandsintown.com/artists/#{@artist}/events.json?api_version=2.0&app_id=#{key}")
  end

  def get_show_info
    @response

  end

end
