class UserAuthenticationController < ApplicationController

  layout 'application'

  def login

  end

  def attempt_login
    attempt_admin
    attempt_instructor
    attempt_student
  end

  def logout
    session[:id] = nil
    session[:type] = nil
    flash[:notice] = "Please login to continue"
    redirect_to user_authentication_login_path
  end

  private
  
  def manage_error
    flash[:notice] = "Invalid Username and password combination"
    redirect_to user_authentication_login_path
  end

  def attempt_admin
    admin = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    if admin
      session[:id] = admin.id.to_s
      session[:type] = "1"
      flash[:notice] = "Successfully logged in"
      redirect_to dashboard_admin_path
    end
  end

  def attempt_instructor
    instructor = Instructor.find_by(username: params[:username]).try(:authenticate, params[:password])
    if instructor
      session[:id] = instructor.id.to_s
      session[:type] = "2"
      flash[:notice] = "Successfully logged in"
      redirect_to dashboard_instructor_path
    end
  end

  def attempt_student
    student = Student.find_by(student_no: params[:username]).try(:authenticate, params[:password])
    if student
      session[:id] = student.id.to_s
      session[:type] = "3"
      flash[:notice] = "Successfully logged in"
      redirect_to dashboard_student_path
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
