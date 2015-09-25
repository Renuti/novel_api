require 'httparty'
require 'byebug'

class ArtistRecs

  def initialize(artist)
    @recommendation = Recommendation.new(artist)
    @artist = Artist.new(artist)
  end





end
