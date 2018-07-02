class BooksController < ApplicationController
   before_action :logged_in_librarier, only: [:index, :edit, :update, :new, :destroy, :show, 
    :avaliable, :borrowed]

  def new
    @book = Book.new
    #books = Book.where(disponivel: true)
  end

  def show 
    @book = Book.find(params[:id])
  end  

  def index
    @books = Book.all.order(:title)
  end

  def avaliable
    @avaliable_books = Book.where(disponivel:true).count
    @books_avaliable = Book.where(disponivel: true)
  end  

  def borrowed
    @borrowed_books = Book.where(disponivel:false).count
    @books_borrowed = Book.where(disponivel: false)
  end

  def edit 
    @book = Book.find(params[:id])
  end 

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book registred with success"
      redirect_to '/librarier/book/index'
    else
      flash.now[:danger] = 'Alguns dados estao invalidos'
      render 'new'   
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "book deleted"
    redirect_to '/librarier/book/index'
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "Book updated"
      redirect_to '/librarier/book/index'
    else
      render 'edit'
    end
  end

  def logged_in_librarier
      unless librarier_logged_in?
        flash[:danger] = "Only librariers authenticated can this link"
        redirect_to root_path
      end
  end


  private

   def book_params
      params.require(:book).permit(:title, :author, :genre, :number_page, :year, :picture)
   end



end
