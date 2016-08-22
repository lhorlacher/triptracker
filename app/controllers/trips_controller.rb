class TripsController < ApplicationController
  before_action :trip, only: [:edit, :update, :destroy, :show]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trip_locations_path(@trip)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_path(@trip)
    else
      rener :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private

    def trip_params
      params.require(:trip).permit(:name, :begin, :end, :people, :notes, :image)
    end

    def trip
      @trip = Trip.find(params[:id])
    end
end
