class ListingsController < ApplicationController
	def new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(listing_params)
		# @listing = Listing.new(listing_params)
		# @listing.user_id = current_user.id
		
		if @listing.save 
			flash[:notice] = "Listing is created!"
			redirect_to root_path
		else
			flash[:notice] = "Some fields are not correct"
			redirect_to new_listing_path
		end
	end


	private
	def listing_params
		params.require(:listing).permit(:tag_list, :name, :description, :house_rules, :number_of_beds, :number_of_guests, :number_of_bedrooms, :number_of_bathrooms, :street_location, :city_location, :country_location, :price, :date_start, :date_end)
	end
end
