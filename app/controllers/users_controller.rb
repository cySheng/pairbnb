class UsersController < Clearance::UsersController
	def user_from_params
		User.new(params.require(:user).permit(:email, :name, :phone_number, :government_id, :location, :gender, :birthday, :autobiography, :password))
	end 
end