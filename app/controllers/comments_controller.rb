class CommentsController < ApplicationController
  
  before_action :get_blog
  before_action :get_post
  before_action :get_comment, only: [:edit, :update, :destroy]
 
  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      
      flash[:notice] = "Successfully created comment!"
      respond_to do |format|
       format.html 
       format.json 
       format.js
      end
      AdminemailMailer.ccreate(@post.blog.user.email,@comment.post.title, @comment).deliver_now

      redirect_to blog_post_path(@blog, @post)
    else 
      redirect_to action: "new" 
    end

  end

  def index 
 	  @comments = @post.comments
  end

  def edit
  end

  def destroy
    @comments = @post.comments
    @comment.destroy
    respond_to do |format|
      # format.html 
      # format.json 
      format.js
    end
    #redirect_to blog_post_path(@blog, @post)
  end 

  def update
    @comments = @post.comments
    if @comment.update(comment_params)
       respond_to do |format|
       format.html 
       format.json 
       format.js
      end
      #redirect_to blog_post_path(@blog, @post)
    else
      render 'edit'
    end 
  end  
 
  def get_blog
    @blog = Blog.find(params[:blog_id])
  end 
 
  def get_post 
    @post = @blog.posts.find(params[:post_id])
  end
 
  def get_comment
    @comment = @post.comments.find(params[:id])
  end 
  def get_user
   @user = current_user  
  end
 
  private
  def comment_params
    params.require(:comment).permit(:ucomment)
  end
end


