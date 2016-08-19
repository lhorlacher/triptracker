class AddressesController < ApplicationController

  def index
    @address = address.all
  end


  def show
    @address =  @location.adress
  end

  def new
    @address = Address.new
  end


  def create

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
    params.require(:address).permit(:street, :city, :state, :country, :zip)
  end








end
