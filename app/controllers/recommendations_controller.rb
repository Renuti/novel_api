class RecommendationsController < ApplicationController
  def index
    render json: Recommendation
  end

  # def show
  # end
end
