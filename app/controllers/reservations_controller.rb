class ReservationsController < ApplicationController
 	 before_action :require_login, only: [:new, :create, :destroy]

	def new
		@listing = Listing.find(params[:id])
		@reservation = Reservation.new
	end

	def create
		@listing = Listing.find(params[:id])
		@reservation = current_user.reservations.build(listing_id: reservation_params[:listing_id], check_in: reservation_params[:check_in], check_out: reservation_params[:check_out])
		if @reservation.save
			ReservationMailer.send(user_id)
			redirect_to listing_path(@listing)
		else
			flash[:error] = "Reservation failed"
		end
	end

	def destroy
		@reservation.destroy
	end

	private

	def reservation_params
		params.require(:reservation).permit(:user_id, :listing_id, :check_in, :check_out)  
	end
end
