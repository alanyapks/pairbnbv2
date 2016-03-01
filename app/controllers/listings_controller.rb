class ListingsController < ApplicationController
  def index
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      flash[:success] = "Created new listing"
      redirect_to @listing     
    else
      render 'new'
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def listing_params
    params.require(:listing).permit(:property_type, :room_type, :accommodates, :bedrooms, :beds, :bathrooms, :name, :description, :country, :address, :city, :state, :zip_code)
  end
end
