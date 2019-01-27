class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(loc_params)
    if @location.valid?
      @location.save
      redirect_to @location
    else
      puts @location.errors.messages
      render 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def show
    @location = Location.find(params[:id])
  end

  def index
    if params[:search].present?
      @locations = Location.where(params[:search], 50, :order => :distance)
    else
      @locations = Location.all
    end
  end

  private

  def loc_params
    params.require(:location).permit(:address)
  end

end
