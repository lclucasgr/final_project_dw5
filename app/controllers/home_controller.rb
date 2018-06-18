class HomeController < ApplicationController

  def index
  	@books = Book.all
  end

  def chat

  end	

end
