class BoatsController < ApplicationController
	
	def index
		@boats = Boat.all
	end

	def new 
		@boat = Boat.new
	end

	def create
		@boat = Boat.create(boat_params)
		if @boat.save
			redirect_to @boat
		else 
			render :new
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
		params.require(:boat).permit(:name, :max_container, :location, :user_id, :avatar).merge(user_id: current_user)
	end
end

