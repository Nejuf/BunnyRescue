class UsersController < ApplicationController
	before_filter :require_current_user!, only: [:update, :destroy]
	before_filter :require_no_current_user!, only: [:create]

	def create
		@user = User.new(user_params)

		if @user.save
			self.current_user = @user
			render json: @user
		else
			render json: @user.errors.full_messages, status: 400
		end
	end

	# # def new

	# # end

	def index
		@users = User.all
		render json: @users
	end

	def show
		@user = User.find(params[:id])
		render json: @user
	end

	# # def edit

	# # end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			render json: @user
		else
			render json: @user.errors.full_messages, status: 400
		end
	end

	def destroy
		@user = User.find(params[:id])

		if @user.destroy
			render json: @user
		else
			render json: @user, status: 400
		end
	end

	# def user_params
	# 	params[:user].permit(:name, :password)
	# end
end
