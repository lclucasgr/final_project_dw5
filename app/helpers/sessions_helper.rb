module SessionsHelper
   def log_in(admin)
    session[:admin_id] = admin.id
  end

  def log_in_librarier(librarier)
    session[:librarier_id] = librarier.id
  end

  def log_out
    session.delete(:admin_id)
    #@current_user = nil
  end

  def log_out_librarier
  	session.delete(:librarier_id)
  end
end
