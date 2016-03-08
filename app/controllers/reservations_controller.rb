class ReservationsController < ApplicationController
 	 before_action :require_login, only: [:new, :create, :destroy]

	def new
		@reservation = Reservation.new
	end

	def create
		# byebug
		@listing = Listing.find(params[:listing_id])
		@reservation = current_user.reservations.new(reservation_params)
		@reservation.listing_id = params[:listing_id]
		# byebug
		if @reservation.save
			flash[:error] = "Reserve success"
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
		params.require(:reservation).permit(:user_id, :check_in, :check_out)  
	end
end
