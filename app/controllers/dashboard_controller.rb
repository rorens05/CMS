class DashboardController < ApplicationController

  before_action :check_user

  def student
  end

  def instructor
  end

  def admin
  end

  private
  def check_user
    if is_admin?
      if action_name != 'admin'
        redirect_to dashboard_admin_path
      end
    elsif is_instructor?
      if action_name != 'instructor'
        redirect_to dashboard_instructor_path
      end
    elsif is_student?
      if action_name != 'student'
        redirect_to dashboard_student_path
      end
    end
  end
end
