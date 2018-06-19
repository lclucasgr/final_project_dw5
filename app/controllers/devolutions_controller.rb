class DevolutionsController < ApplicationController
   before_action :logged_in_librarier, only: [:index, :edit, :update, :new, :destroy]

   def create
    
    @devolution = Devolution.new(devolution_params)
    if @devolution.save
      flash[:success] = "Devolution registred with success"
      @devolution.book.update(disponivel: true)
      #Devolution.broadcast_notification('web_notification_channel', {title: 'Teste', message: 'Teste'})
      
      borrowed_books = Book.where(disponivel:false).count
      ActionCable.server.broadcast "notification",
            message: "Livro #{@devolution.book.title} devolvido",
            borrowed_books: borrowed_books
      redirect_to '/emprestimos'
      
      
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
