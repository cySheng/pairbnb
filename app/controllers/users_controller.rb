class UsersController < Clearance::UsersController
	def user_from_params
		@user = 
			if params[:user]
				User.new(user_params)
			else
				User.new
			end
	end

	def edit
		@user = User.find(current_user.id)
	end

	def update
		current_user.update(user_params)
		redirect_to "/"
	end

	private
	def user_params
		params.require(:user).permit(:email, :last_name, :first_name, :phone_number, :government_id, :location, :gender, :birthday, :autobiography, :password)
	end
end