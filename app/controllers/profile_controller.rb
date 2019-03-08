class ProfileController < ApplicationController
  skip_before_action :restrict_student 

  def index
    if session[:type] == "3"
      @student = Student.find(session[:id])
    else
      redirect_to '/404.html'
    end 
  end

  def edit
    @student = Student.find(session[:id])
  end

  def update

    @student = Student.find(session[:id])
    @student.email = params[:email]
    @student.image = params[:image]
    @student.contact_no = params[:contact_no]
    @student.gender = params[:gender]
    birthday = params[:birthday]
    date = Date.new birthday["{}(1i)"].to_i, birthday["{}(2i)"].to_i, birthday["{}(3i)"].to_i

    @student.birthday = date
    @student.address = params[:address]

    if @student.save
      flash['notice'] = "Profile updated Successfully"
      redirect_to profile_index_path
    else
      flash[:notice] = @student.errors.full_messages
      render 'edit'
    end
    
  end

  def change_password
    @student = Student.find(session[:id])

  end

  def save_new_password
    @student = Student.find(session[:id])
    if(@student.authenticate(params[:old_password]))
      if params[:new_password] == params[:confirm_password]
        @student.password = params[:new_password]
        @student.save
        flash['notice'] = "Password changed Successfully"
        redirect_to profile_index_path
      else
        flash['notice'] = "Password did not match"
        render 'change_password'
      end
    else
      # redirect
      flash['notice'] = "Invalid password"
      render 'change_password'
    end

  end
end
