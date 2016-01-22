class SessionsController < ApplicationController
	def new
		if session[:user_id] != nil
			redirect_to User.find(session[:user_id])
		end
	end

	def create
		if session[:user_id] == nil
			@user = User.where(username: params[:username]).first

			if @user && @user.authenticate(params[:password])
				session[:user_id] = @user.id
				redirect_to @user
			else
				redirect_to root_path
			end
		else
			redirect_to User.find(session[:user_id])
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path
	end
end
