class StudentsController < ApplicationController
  before_action :logged_in_librarier, only: [:index, :edit, :update, :new, :destroy, :show]
  
  def new
  	@student = Student.new
  end


  def show 
    @student = Student.find(params[:id])
  end 

  def index
     @students = Student.all
     @quantity_students = Student.count
  end

  def edit 
    @student = Student.find(params[:id])
  end 

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Students registred with success"
      redirect_to '/students'
      
    else
      flash.now[:danger] = 'Alguns dados estao invalidos'
      render 'new'   
    end
  end

  
    def destroy
      Student.find(params[:id]).destroy
      flash[:success] = "Student Deleted"
      redirect_to '/students'
    end


  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      flash[:success] = "Student updated"
      redirect_to '/students'
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

    def logged_in_admin
      unless admin_logged_in?
        flash[:danger] = "Only admins authenticated can this link"
        redirect_to root_path
      end
    end


  private

   def student_params
      params.require(:student).permit(:name, :email, :turma, :celular)
   end


end
