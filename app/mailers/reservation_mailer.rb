class ReservationMailer < ApplicationMailer
	def booking_email(customer, host, reservation_id)
		@user = customer
		@host = host
		@reservation_id = reservation_id
		mail(to: @host.email, subject: "Your place was booked.")
	end
end
