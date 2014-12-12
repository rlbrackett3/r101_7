class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			flash[:notice] = "User created"
			redirect_to home_path
		else
			flash[:alert] = "problem"
			redirect_to new_user_path
		end
	end

	def show
		@user = User.find(session[:user_id])
		@posts = @user.posts
	end


	
	private
	def user_params
		params.require(:user).permit(:email,:password,:password_confirmation)
	end

end

