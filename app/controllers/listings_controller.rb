class ListingsController < ApplicationController

  before_action :require_login, only: [:edit, :update]

  def index
    if params[:query].present?
      @listings = Listing.search(params[:query], page:params[:page])
    else
      # @listings = Listing.all.page params[:page]
      @listings = current_user.listings.all          
    end
  end

  def new
    @user = current_user
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to @listing     
    else
      render 'new'
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update_attributes(listing_params)
      flash[:success] = "Listing updated"
      redirect_to @listing
    else
      render 'edit'
    end
  end

  def destroy
    @listing.destroy
    flash[:sucess]="Listing deleted"
    redirect_to '/'
  end

  private

  def listing_params
    params.require(:listing).permit(:property_type, :room_type, :accommodates, :bedrooms, :beds, :bathrooms, :name, :description, :country, :address, :city, :state, :zip_code, {photos: []})
  end
end
