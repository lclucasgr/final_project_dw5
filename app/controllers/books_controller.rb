class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def edit 
    @book = Book.find(params[:id])
  end 

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book registred with success"
      redirect_to '/books'
      
    else
      flash.now[:danger] = 'Alguns dados estao invalidos'
      render 'new'   
    end
  end

    def destroy
      Book.find(params[:id]).destroy
      flash[:success] = "book deleted"
      redirect_to '/books'
    end


  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "Book updated"
      redirect_to '/books'
    else
      render 'edit'
    end
  end

   private

   def book_params
      params.require(:book).permit(:title, :author, :genre, :number_page, :year)
   end



end
