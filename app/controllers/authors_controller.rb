class AuthorsController < ApplicationController
  def new
    @page_title = 'Add New Author'
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save #if the save is successful, redirect. if it's not, reload the create form
      flash[:notice] = "Author Created" #flashes message. must update the layout page for it to work on all pages

      redirect_to authors_path 
    else 
      render 'new'
    end 
    
  end

  def update
    @author = Author.find(params[:id])

    @author.update(author_params)

    flash[:notice] = 'Author Updated'

    redirect_to authors_path
  end

  def edit 
    @author = Author.find(params[:id])
  end

  def destroy
    @author = Author.find(params[:id])

    @author.destroy

    flash[:notice] = 'Author Removed'

    redirect_to authors_path
  end

  def index
    @authors = Author.all
  end

  def show
  end

  private 
    def author_params
    params.require(:author).permit(:first_name, :last_name)
  end

end
