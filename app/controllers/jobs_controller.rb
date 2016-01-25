class JobsController < ApplicationController

	def index
		@job = Job.all
	end

	def new 
		@job = Job.new
	end


	def create
       @job = Job.new(job_params)
	end

   	private

   	def job_params
        params.require(:job).permit(:name, :cost, :description, :origin, :destination, :user_id, :boat_id)
   	end
end
