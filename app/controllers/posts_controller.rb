class PostsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  
  def index
    @posts = Post.all
    #if user is not an admin, then only pull posts with approved true
    #debugger
  
  end

  def show
    #@post = Post.find(params[:id])
  end

  def new 
    #@post = Post.new
  end

  def create
    #@post = Post.new(params[:post])
    if @post.save
      redirect_to posts_path, :notice => "Your post was saved."
    else
      render "new"
    end
  end

  def edit
    #@post = Post.find(params[:id])
    #authorize! :update, @post
  end

  def update
        flash[:notice] = "hello there"

    if @post.update_attributes(params[:post])
      redirect_to posts_path, :notice => "Your post was updated."
    else
      render "edit"
    end
  end

  def destroy

  end

  def approve_post
    #for the specific post that was passed in update status to approved and save it in t
    #the DB
    #set the status of the post to approved then redirect to index page
      @post = Post.find(params[:id])
      #set the status of the post to approved
      @post.status_id = 3
      @post.save
      redirect_to posts_path, :notice => "Your post was approved."
  end

end
