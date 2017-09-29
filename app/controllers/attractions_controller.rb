class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save ? (redirect_to attraction_path(@attraction)) : (render :new)
  end

  def show
  end

  def edit
  end

  def update
    @attraction.update(attraction_params) ? (redirect_to attraction_path(@attraction)) : (render :edit)
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_path
  end


  private


  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

end
