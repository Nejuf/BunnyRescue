class UsersController < ApplicationController
	# before_filter :require_current_user!, only: [:destroy]
	# before_filter :require_no_current_user!, only: [:create]

	def create
		@user = User.new(user_params)

		if @user.save
			render json: @user
		else
			render json: @user.errors.full_messages
		end
	end

	# def new

	# end

	def index
		@users = User.all
		render json: @users
	end

	def show
		@user = User.find(params[:id])
		render json: @user
	end

	# def edit

	# end

	def destroy
		@user = User.find(params[:id])

		if @user.destroy
			render json: 
		else
			render json: @user
		end
	end

	def user_params
		params[:user].permit(:name)
	end
end
