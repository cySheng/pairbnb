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
		byebug
		if current_user.update(user_params)
			flash[:notice] = "User info successfully updated!"
			redirect_to "/"
		else
			flash[:error] = current_user.errors.messages
			redirect_to edit_user_path(current_user)
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :last_name, :first_name, :phone_number, :government_id, :location, :gender, :birthday, :autobiography, :password)
	end
end