class LocationsController < ApplicationController
  before_action :trip
  before_action :location, except: [:index, :new, :create]

  def index
  	@locations = @trip.locations
  end

  def show
  end

  def new
    @location = Trip.new

  end

  def create
  	@location = @trip.locations.new(location_params)

    if @location.save
  	  redirect_to trip_location_index_path(@trip)
    else
	  render :new
    end
  end

  def edit
  end

  def update
  	if @location.udpate(location_params)
  	  redirect_to trip_location_index_path(@trip)
  	else
      render :edit
    end
  end

  def destroy
  	@location.destroy
  	redirect_to trip_location_index_path(@trip)
  end

  private

  	def location_params
  		params.require(:location).permit(:where, :type, :days)
	end

	def trip
		@trip = Trip.find(params[:trip_id])
	end

	def location
		@location = @trip.find(params[:id])
	end
end
