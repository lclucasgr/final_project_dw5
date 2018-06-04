class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      flash[:success] = "Welcome to the Bibliolivre"
      redirect_to '/admins'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'admins'
    end
  end

  def login
    librarier = Librarier.find_by(email: params[:session][:email].downcase)
    if librarier && librarier.authenticate(params[:session][:password])
      log_in_librarier librarier
      flash[:success] = "Welcome to the Bibliolivre"
      redirect_to '/books'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'librariers'
    end
  end

   def destroy
    log_out
    redirect_to root_url
  end

  def finish
    log_out_librarier
    redirect_to root_url
  end   
end
