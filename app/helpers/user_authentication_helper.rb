module UserAuthenticationHelper
  

  def require_login
    if session[:id].blank?
      redirect_to user_authentication_login_path
    end
  end

  def redirect_to_current_user
    if session[:id].present?
      redirect_to dashboard_admin_path
    end
  end
  
  def is_login?
    if session[:id]
      return true
    else
      return false
    end
  end

  def is_not_login?
    if session[:id]
      return false
    else
      return true      
    end
  end

  def is_admin?
    if session[:type] == "1"
      return true
    end
  end

  def is_instructor?
    if session[:type] == "2"
      return true
    end
  end

  def is_student?
    if session[:type] == "3"
      return true
    end
  end
  
  def current_user
    if is_admin?
      return User.find(session[:id])
    elsif is_student?
      return Student.find(session[:id])
    elsif is_instructor?
      return Instructor.find(session[:id])
    end
  end

end
