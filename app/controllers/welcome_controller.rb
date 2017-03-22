class WelcomeController < ApplicationController
	def home
		if signed_in?
			@listing = Listing.all.first(5)
			render "welcome/home"
		else
			redirect_to "/sign_up"
		end
	end
end