class BoatsController < ApplicationController
	
	def index
		@boats = Boat.all
	end

	def new 
		@boats = Boat.new
	end

	def create
		@boats = Boat.create(boat_params)
		if @boats.save
			redirect_to @boats
		end
	end

	def show
		@boat = Boat.find(params[:id])
	end

	def update
	end

	def destroy
	end

	private
	def boat_params
		params.require(:boat).permit(:name, :max_container, :location, :avatar)
	end
end

