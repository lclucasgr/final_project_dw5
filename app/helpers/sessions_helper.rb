module SessionsHelper
   def log_in(admin)
    session[:admin_id] = admin.id
  end

  def log_in_librarier(librarier)
    session[:librarier_id] = librarier.id
  end

   def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

   def current_librarier
    @current_librarier ||= Librarier.find_by(id: session[:librarier_id])
  end

  def admin_logged_in?
    !current_admin.nil?
  end

  def librarier_logged_in?
    !current_librarier.nil?
  end  

  def log_out
    session.delete(:admin_id)
    @current_admin = nil
  end

  def log_out_librarier
  	session.delete(:librarier_id)
    @current_librarier = nil
  end
end
