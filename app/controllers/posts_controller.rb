class PostsController < ApplicationController
	 before_action :get_blog
   before_action :get_post, only: [:show, :edit, :update, :destroy, :verify]
	
	def new
		@post = Post.new
	end

	def create
		#@post = Post.new(post_params)
		# @post.user = current_user
		# if @post.save
		# 	redirect_to blogs_path
	  #  else
	  #  	redirect_to action: "new"	
	  #  end	
	  @blog = current_user.blogs.find(params[:blog_id])
   	@post = @blog.posts.create(post_params)
    @post.save
    redirect_to blogs_path(@blog)
	end	

	def index
		@blog = Blog.find(params[:blog_id])
		@post = @blog.posts

	end

	def destroy
		@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to blog_posts_path
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@blog = current_user.blogs.find(params[:blog_id])
		@post = Post.find(params[:id])
		if @post.update(post_params)
    	redirect_to action: "index"
  	else
    	render 'edit'
  	end
	end

	def show		
		@blog = Blog.find(params[:blog_id])
		@comments = @post.comments
		@comment = @post.comments.new
	end

	def verify
		@post.update_columns(published: true)
    flash[:notice] = "Successfully verified!"
    AdminemailMailer.pverify(@post.blog.user.email, @post).deliver_now
    redirect_to action: "index"
	end	

	def post_params
		params.require(:post).permit(:title, :body, :image, :ucomment)
	end

	def get_blog
		@blog = Blog.find(params[:blog_id])
	end	

	 def get_post
     @post = @blog.posts.find(params[:id])
   end
end