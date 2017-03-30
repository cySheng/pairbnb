class BookingsController < ApplicationController
	def create
		@booking = current_user.bookings.new(booking_params)
		@booking.listing_id = params[:listing_id]
		if @booking.save && !(@booking.check_overlapping_dates)
			flash[:notice] = "Your bookings have been saved!"
			redirect_to user_path(current_user)
		else
			flash[:error] = "There was an error with your booking!"
			redirect_to listings_path
		end
	end


	private
	def booking_params
		params.require(:booking).permit(:date_start, :date_end)
	end
end
