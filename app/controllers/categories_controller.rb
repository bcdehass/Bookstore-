class CategoriesController < ApplicationController
  def new
    @page_title = 'Add New Category'
    @category = Category.new 
  end

  def create
    @category = Category.new(category_params) #create new category using the params from the private function at the bottom of this file
    @category.save
    
    redirect_to categories_path 

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
