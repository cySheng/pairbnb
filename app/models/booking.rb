class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :listing

	def overlap?(x,y) #x is listing , y is booking
		(x.date_start - y.date_end) * (y.date_start - x.date_end) > 0
		# if y.date_start < x.date_start
		# 	flash[:error1] = "The place is not yet available at this date yet."
		# 	return true
		# elsif y.date_end > x.date_end
		# 	flash[:error1] = "The place is not available until your end date"
		# 	return true
	end

	@booking.overlap?


	def check_overlapping_dates
		self.listing.bookings.each do |x| 
			overlap?(self, x)
		end
		return false
	end
end
