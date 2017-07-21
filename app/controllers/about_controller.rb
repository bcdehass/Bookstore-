class AboutController < ApplicationController
  
  before_filter :index

  def index
  	@page_title = 'About Us';
  end
end
