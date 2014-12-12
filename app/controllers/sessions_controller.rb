class SessionsController < ApplicationController

	def new

	end
	
	def create
		@user = User.authenticate(params[:email],params[:password])
		if @user
			flash[:notice] = "welcome"
			session[:user_id] = @user.id
			redirect_to user_path(:id=>session[:user_id])
		else
			flash[:alert] = "problem"
			redirect_to log_in_path
		end
	end
	
	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged Out"
		redirect_to log_in_path
	end
end
