class ApplicationController < ActionController::Base

	def current_user
		@current_user = session[:user_id]
	end	

  protect_from_forgery with: :exception
end

