class SessionsController < ApplicationController

	#Login
	def create
		user = User.find_by_credentials(
			params[:user][:name],
			params[:user][:password]
			)

		if user.nil?
			render json: { error: 'Could not find user with that name and password combination.' }, status: 401
		else
			self.current_user = user
			render json: user
		end
	end

	#Logout
	def destroy
		logout_current_user!
		render json: self.current_user, status: 200
	end
end
