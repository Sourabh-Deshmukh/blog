class BlogsController < ApplicationController
	
	before_action :get_blog, only: [:edit, :update, :destroy]

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.user = current_user
		if @blog.save
			redirect_to new_blog_post_path(@blog.id)
	  else
	  	redirect_to action: "new"	
	  end	
	end	
	
	def index
		@blog = Blog.all	
	end

	def destroy
		@blog.destroy
  	redirect_to blogs_path
	end

	def edit
	end

	def update
		if @blog.update(blog_params)
    	redirect_to blogs_path(@blog)
  	else
    	render 'edit'
  	end
	end

	def blog_params
		params.require(:blog).permit(:blogname)
	end

	def get_blog
    @blog = Blog.find(params[:id])	
  end	
end
