class DevolutionsController < ApplicationController
   before_action :logged_in_librarier, only: [:index, :edit, :update, :new, :destroy]

   def create
    
    @devolution = Devolution.new(devolution_params)
    if @devolution.save
      flash[:success] = "Devolution registred with success"
      @devolution.book.update(disponivel: true)
    
      
      borrowed_books = Book.where(disponivel:false).count
      ActionCable.server.broadcast "notification",
            message: "#{@devolution.book.loans.first.student.name} emprestou o livro #{@devolution.book.title} dia #{@devolution.book.loans.first.created_at} e devolveu dia #{@devolution.created_at}
            ",
            borrowed_books: borrowed_books
      
      redirect_to '/librarier/loan/index'
      
    else
      flash.now[:danger] = 'Alguns dados estao invalidos'
      render 'new'   
    end 
  end 

  def new
  	@devolution = Devolution.new;
    @livros = Book.where(disponivel: false)

  end

   def logged_in_librarier
      unless librarier_logged_in?
        flash[:danger] = "Only librariers authenticated can this link"
        redirect_to root_path
      end
    end

   
  private

  def devolution_params
      params.require(:devolution).permit(:book_id)
    end
 

end
