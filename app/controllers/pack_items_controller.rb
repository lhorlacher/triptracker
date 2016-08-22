class PackItemsController < ApplicationController
  def index
  	@trip = Trip.find(params[:trip_id])
  	@locations = PackItem.loc_options(@trip)
  	@pack_items = @trip.pack_items
  end

  def new
  	@trip = Trip.find(params[:trip_id])
  	@pack_item = PackItem.new
  end

  def create
  	@trip = Trip.find(params[:trip_id])
  	@pack_item = @trip.pack_items.new(pack_item_params)

  	if @pack_item.save
  	  redirect_to trip_pack_items_path(@trip)
	else
	  render :new
	end
  end

  def show
  	@trip = Trip.find(params[:trip_id])
  	@locations = @trip.locations
  	@pack_item = @trip.pack_items.find(params[:id])
  end

  def edit
  	@trip = Trip.find(params[:trip_id])
  	@pack_item = @trip.pack_items.find(params[:id])
  end

  def update
  	@trip = Trip.find(params[:trip_id])
  	@pack_item = @trip.pack_items.find(params[:id])

  	if @pack_item.update(pack_item_params)
  	  redirect_to trip_pack_items_path(@trip)
    else
      render :edit
    end
  end

  def destroy
  	@trip = Trip.find(params[:trip_id])
  	@pack_item = @trip.pack_items.find(params[:id]).destroy
	redirect_to trip_pack_items_path(@trip)
  end

  private

  def pack_item_params
  	params.require(:pack_item).permit(:name, :is_like, :location, :notes, :packed)
  end

  def trip
  	@trip = Trip.find(params[:trip_id])
  end

  def pack_items
  	@pack_item = @trip.pack_item(params[:id])
  end

end
