class ApplicationController < ActionController::Base
 
  layout :set_layout

  before_action :require_login, except: [:login, :logout, :attempt_login] 
  before_action :redirect_to_current_user, only: [:login , :attempt_login] 
  before_action :show_console
  before_action :restrict_student 

  def show_console
    if Rails.env.development?
      console
    end
  end
 

  def set_layout
    if is_admin?
      'admin'
    elsif is_instructor?
      'instructor'
    elsif is_student?
      'student'
    end
  end

  def admin_only
    unless session[:type] == "1"
      redirect_to "/422.html"
    end
  end

  def restrict_student
    if session[:type] == "3"
      redirect_to "/422.html"
    end
  end

  

  # user authentication
  def require_login
    # session[:id] = nil
    # session[:type] = nil    
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


end
