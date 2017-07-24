class CategoriesController < ApplicationController
  def new
    @page_title = 'Add New Category'
    @category = Category.new 
  end

  def create
    @category = Category.new(category_params) #create new category using the params from the private function at the bottom of this file
    if @category.save #if the save is successful, redirect. if it's not, reload the create form
      flash[:notice] = "Category Created" #flashes message. must update the layout page for it to work on all pages

      redirect_to categories_path 
    else 
      render 'new'
    end 

  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  private 
    def category_params
    params.require(:category).permit(:name)
  end

end
