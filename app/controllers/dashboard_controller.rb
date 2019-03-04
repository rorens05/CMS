class DashboardController < ApplicationController

  before_action :check_user, except: [:classes, :class_information, :test_dashboard]
  skip_before_action :restrict_student
 
  def student
  end

  def instructor
    @customized = Student.group(:year).count
    @customized = @customized.to_h
    @customized["1st year"] = @customized.delete 1
    @customized["2nd year"] = @customized.delete 2
    @customized["3rd year"] = @customized.delete 3
    @customized["4th year"] = @customized.delete 4
  end

  def admin
    @customized = Student.group(:year).count
    @customized = @customized.to_h
    @customized["1st year"] = @customized.delete 1
    @customized["2nd year"] = @customized.delete 2
    @customized["3rd year"] = @customized.delete 3
    @customized["4th year"] = @customized.delete 4
  end

  def classes
    @subject_classes = []

    @school_year = SubjectClass.last.school_year
    @sem = SubjectClass.last.sem
    if params[:sem] && params[:school_year]
      @school_year = params[:school_year]
      @sem = params[:sem]
    end
    
    SubjectClass.all.each do |sc|      
      sc.class_enrollments.each do |ce|
        if ce.student_id.to_s == session[:id]
          if sc.sem == @sem and sc.school_year.to_s == @school_year
            @subject_classes << sc
          end
        end
      end
    end
  end

  def class_information
    @subject_class = SubjectClass.find(params[:id])
    @instructor = @subject_class.instructor
  end

  def test_dashboard
    @test = Test.find(params[:test_id])
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
