class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    #@posts = Post.all
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
    if @post.update_attributes(params[:post])
      redirect_to posts_path, :notice => "Your post was updated."
    else
      render "edit"
    end
  end

  def destroy

  end

end
