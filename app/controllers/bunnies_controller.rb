class BunniesController < ApplicationController
	before_filter :require_current_bunny!, only: [:update, :destroy]
	before_filter :require_no_current_bunny!, only: [:create]

	def create
		@bunny = Bunny.new(bunny_params)

		if @bunny.save
			self.current_bunny = @bunny
			render json: @bunny
		else
			render json: @bunny.errors.full_messages, status: 400
		end
	end

	# # def new

	# # end

	def index
		@bunnies = Bunny.all
		render json: @bunnies
	end

	def show
		@bunny = Bunny.find(params[:id])
		render json: @bunny
	end

	# # def edit

	# # end

	def update
		@bunny = Bunny.find(params[:id])

		if @bunny.update(bunny_params)
			render json: @bunny
		else
			render json: @bunny.errors.full_messages, status: 400
		end
	end

	def destroy
		@bunny = Bunny.find(params[:id])

		if @bunny.destroy
			render json: @bunny
		else
			render json: @bunny, status: 400
		end
	end
private
	def bunny_params
		params[:bunny].permit(:name, :desc, :age, :status, :temperment, :gender, :fixed)
	end
end
