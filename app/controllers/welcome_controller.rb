class WelcomeController < ApplicationController
	def home
		if signed_in?
			redirect_to listings_path
			# render "welcome/home"
		else
			redirect_to "/sign_up"
		end
	end
end