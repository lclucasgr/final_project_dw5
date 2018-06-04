class AdminsController < ApplicationController
  
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


end
