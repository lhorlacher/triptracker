class LocationsController < ApplicationController

  def index
  	@trip = Trip.find(params[:trip_id])
  	@locations = @trip.locations
   end

  def show
  	@trip = Trip.find(params[:trip_id])
  	@location = @trip.locations.find(params[:id])
  end

  def new
  	@trip = Trip.find(params[:trip_id])
    @location = @trip.locations.new
  end

  def create
  	@trip = Trip.find(params[:trip_id])
  	@location = @trip.locations.new(location_params)
    if @location.save
  	  redirect_to trip_locations_path(@trip)
    else
	  render :new
    end
  end

  def edit
  	@trip = Trip.find(params[:trip_id])
  	@location = @trip.locations.find(params[:id])
  end

  def update
  	@trip = Trip.find(params[:trip_id])
  	@location = @trip.locations.find(params[:id])
  	if @location.update(location_params)
  	  redirect_to trip_locations_path(@trip)
  	else
      render :edit
    end
  end

  def destroy
  	@trip = Trip.find(params[:trip_id])
  	@location = @trip.locations.find(params[:id]).destroy
  	redirect_to trip_locations_path(@trip)
  end

  private

  	def location_params
  	  params.require(:location).permit(:where, :is_like, :days, :notes, :image)
	end

	def trip
		@trip = Trip.find(params[trip_id])
	end

	def location
		@location = @trip.locations.find(params[:id])
	end
end
