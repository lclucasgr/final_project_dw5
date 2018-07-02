class LoansController < ApplicationController
	before_action :logged_in_librarier, only: [:index, :edit, :update, :new, :destroy]
  
  def show
  end	

  def index
  	@loans = Loan.all;
  end

  def create
    @loan = Loan.new(loan_params)
    
    if @loan.save
      flash[:success] = "Loan registred with success"
      @loan.book.update(disponivel: false)
      avaliable_books = Book.where(disponivel:true).count

      StudentMailer.student_email(@loan.student).deliver_later

      ActionCable.server.broadcast "notification",
            message: "Livro #{@loan.book.title} emprestado para #{@loan.student.name
            } dia #{@loan.created_at} para devolver dia #{@loan.created_at + 7.days}",
            avaliable_books: avaliable_books

      redirect_to '/librarier/loan/index'
      
      
    else
      flash.now[:danger] = 'Alguns dados estao invalidos'
      render 'new'   
    end 
  end 

  def new
  	@loan = Loan.new;
    @books = Book.where(disponivel: true).order(:title)

  end 

  def edit
    @loan = Loan.find(params[:id])
  end

  def destroy
    Loan.find(params[:id]).destroy
    flash[:success] = "loan deleted"
    redirect_to '/librarier/loan/index'
  end

  def update
    @loan = Loan.find(params[:id])
    if @loan.update_attributes(loan_params)
      flash[:success] = "Profile updated"
      redirect_to '/emprestimos'
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

  def loan_params
      params.require(:loan).permit(:student_id, :book_id, :data, :disponivel)
  end

end
