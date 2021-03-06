class UsersController < Clearance::UsersController


	# def user_from_params
	# 	@user = 
	# 		if params[:user]
	# 			User.new(user_params)
	# 		else
	# 			User.new
	# 		end
	# end

	def edit
		@user = User.find(current_user.id)
	end

	def create
		byebug
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				flash[:notice] = "You successfully signed up!"
				sign_in(@user)
				format.html { redirect_to root_path }
			else
				flash[:error] = "There was an error signing you up!"
				format.html { redirect_to sign_up_path }
				format.js
			end
		end

	end

	def update
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
		params.require(:user).permit(:avatar, :email, :last_name, :first_name, :phone_number, :government_id, :location, :gender, :birthday, :autobiography, :password)
	end
end
