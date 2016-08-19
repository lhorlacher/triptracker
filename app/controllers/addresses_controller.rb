class AddressesController < ApplicationController
  before_action :trip
  before_action :location
  before_action :address, only: [:show, :edit, :update, :destroy]
  def index
    @address = address.all
  end


  def show
    # @address =  @locations.address
  end

  def new
    @address = Address.new
  end


  def create
    @adress = @trip.location.address.new(address_params)
    if @address.save
      redirect_to trip_location_address_path(@trip, @location, @adress)
    else
      render :new
    end
  end

  def edit
    @address = @trip.location.address.find(params[:id])
  end


  def update
    if @address = @trip.location.address.find(params[:id])
      redirect_to trip_location_address_path
    else
      render :edit
    end
  end


  def destroy
    @address.destroy
    redirect_to trip_location_address_path
  end



  private

  def address
    @address = @trip.location.address.find(params[:id])
  end

  def loction
    @location = @trip.location.find(params[:id])
  end

  def trip
    @trip = Trip.find(params[:trip_id])
  end

  def address_params
    params.require(:address).permit(:street, :city, :state, :country, :zipcode)
  end








end
