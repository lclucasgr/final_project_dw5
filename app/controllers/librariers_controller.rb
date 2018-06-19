class LibrariersController < ApplicationController
   before_action :logged_in_admin, only: [:index, :edit, :update, :new, :destroy]
   before_action :logged_in_librarier, only: [:dashboard]

  def show
    @librarier = Librarier.find(params[:id])
  end

  def dashboard
    @quantity_books = Book.count
    @quantity_students = Student.count
    @avaliable_books = Book.where(disponivel:true).count
    @borrowed_books = Book.where(disponivel:false).count
  end   

  def index
    @librariers = Librarier.all
  end 

  def new
    @librarier = Librarier.new
  end

  def edit 
    @librarier = Librarier.find(params[:id])
  end

    def destroy
    Librarier.find(params[:id]).destroy
    flash[:success] = "librarier deleted"
    redirect_to '/librariers'
  end

  def create
    @librarier = Librarier.new(librarier_params)
    if @librarier.save
      flash[:success] = "Librarier registred with success"
      redirect_to '/librariers'
      
    else
      flash.now[:danger] = 'Alguns dados estao invalidos'
      render 'new'   
    end
  end

  def update
    @librarier = Librarier.find(params[:id])
    if @librarier.update_attributes(librarier_params)
      flash[:success] = "Profile updated"
      redirect_to '/librariers'
    else
      render 'edit'
    end
  end

  def logged_in_admin
      unless admin_logged_in?
        flash[:danger] = "Only admins authenticated can this link"
        redirect_to root_path
      end
    end

    def logged_in_librarier
      unless librarier_logged_in?
        flash[:danger] = "Only librarier authenticated can this link"
        redirect_to root_path
      end
    end


  private

  def librarier_params
      params.require(:librarier).permit(:name, :email, :password)
    end
end
