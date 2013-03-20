class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new 
  end

  def create     
    if @category.save
      redirect_to :action => :index, :notice => "Your post was saved."
    else
      render "new"
    end
  end

  def edit
  end

  def update
  	 if @category.update_attributes(params[:category])
      redirect_to :action => :index, :notice => "Your post was updated."
    else
      render "edit"
    end
  end

  def destroy
  end

end
