class ArtistRecommendationsController < ApplicationController

  def index
    render json: ArtistRecommendation.new(params[:artist]).return_recommendations
  end

  def show
    render json: ArtistRecommendation.new(params[:artist]).return_one_recommendation
  end

end
