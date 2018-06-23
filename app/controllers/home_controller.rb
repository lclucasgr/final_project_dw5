class HomeController < ApplicationController

  def index
  	@books = Book.all.paginate(page: params[:page], per_page: 6)
  end

end
