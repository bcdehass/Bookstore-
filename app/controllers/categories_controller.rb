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
    @category = Category.find(params[:id])

    @category.update(category_params)

    flash[:notice] = 'Category Updated'

    redirect_to categories_path
  end

  def edit 
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy

    flash[:notice] = 'Category Removed'

    redirect_to categories_path
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @books = @category.books #brings in all books for specific category. 
  end

  private 
    def category_params
    params.require(:category).permit(:name)
  end

end
