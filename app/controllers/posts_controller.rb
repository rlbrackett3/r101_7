class PostsController < ApplicationController

	def index 
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		@user = User.find(params[:user_id])
		if @post.save
			flash[:notice] = "Post created!"
			@user.posts << @post
			redirect_to user_path
		else
			flash[:alert]="Problem"
			redirect_to new_user_post_path
		end

	private

	def post_params
		params.require(:post).permit(:title,:user_id)
	end

	end

end
