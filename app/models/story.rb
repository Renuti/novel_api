require 'httparty'
require 'byebug'

class Story < ActiveRecord::Base

  def initialize(show)
    @show = show
    @response = get_response
  end

  private def get_response
    key = ENV['NPR_KEY']
    HTTParty.get("http://api.npr.org/query?fields=#{@show}&output=JSON&apiKey=#{key}")
  end

  def get_show_info
    @response

  end

end
