class ListingsController < ApplicationController
  def index
    if params[:query].present?
      @listings = Listing.search(params[:query], page:params[:page])
    else
      @listings = Listing.all.page params[:page]      
    end
  end

  def new
    @user = current_user
    @listing = Listing.new
  end

  def create
    @user = current_user
    @listing = @user.listings.build(listing_params)
    if @listing.save
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
    params.require(:listing).permit(:property_type, :room_type, :accommodates, :bedrooms, :beds, :bathrooms, :name, :description, :country, :address, :city, :state, :zip_code, {photos: []})
  end
end
