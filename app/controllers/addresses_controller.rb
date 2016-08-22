class AddressesController < ApplicationController
  # before_action :trip
  before_action :location
  before_action :address, only: [:show, :edit, :update, :destroy]

  def index
    @address = @location.address
  end


  def show
  end

  def new
    @address = Address.new
  end


  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to location_address_path(@location, @address)
    else
      render :new
    end
  end

  def edit
  end


  def update
    if @address.update(address_params)
      redirect_to location_address_path(@location, @address)
    else
      render :edit
    end
  end


  def destroy
    @address.destroy
    redirect_to location_address_path(@location, @address)
  end



  private

  def address
    @address = @location.address
  end

  def location
    @location = Location.find(params[:location_id])
  end

  # def trip
  #   @trip = Trip.find(params[:trip_id])
  # end

  def address_params
    params.require(:address).permit(:street, :city, :state, :country, :zip, :location_id)
  end








end
