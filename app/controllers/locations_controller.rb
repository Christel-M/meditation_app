class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    if @location.valid?
      @location.save
      redirect_to users_path
    else
      puts @location.errors.messages
      render 'new'
    end
  end

  # def edit
  # end

  def show
    @location = Location.find(params[:id])
  end

  def index
    if params[:search].present?
    @locations = Location.near(params[:search], 10, :order => :distance)
  else
    @locations = Location.all
  end
  end
end
