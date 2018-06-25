class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update]
  before_action :correct_admin, only:[:edit, :update]
  
  def new
    @admin = Admin.new
  end

  
  def index
    @admins = Admin.all
  end 
  
   def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:success] = "Admin registred with success"
      redirect_to '/admins'
      
    else
      flash.now[:danger] = 'Alguns dados estao invalidos'
      render 'new'   
    end
  end

   def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      flash[:success] = "Profile updated"
      redirect_to '/librariers'
    else
      render 'edit'
    end
  end

  def edit 
    @admin = Admin.find(params[:id])
  end 

  def destroy
  end

   private

  def admin_params
      params.require(:admin).permit(:name, :email, :password)
    end

    def logged_in_admin
      unless admin_logged_in?
        flash[:danger] = "Only admins authenticated can this link"
        redirect_to root_path
      end
    end

    def correct_admin
      @admin = Admin.find(params[:id])
      redirect_to(root_url) unless current_admin?(@admin)
    end


end
