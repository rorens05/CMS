class SubjectClassesController < ApplicationController
  before_action :set_subject_class, only: [:show, :edit, :update, :destroy, :add_student, :remove_student, :attendances, :new_attendance, :create_attendance]
  

  # GET /subject_classes
  # GET /subject_classes.json
  def index
    @school_year = params[:school_year] || SubjectClass.last.school_year
    @sem = params[:sem] || '2nd Semister'
    @subject_classes = SubjectClass.where(school_year: @school_year, sem: @sem) || nil
    if session[:type] == '2'
      instructor = Instructor.find(session[:id])
      @subject_classes = @subject_classes.where(instructor_id: instructor.id)
    end
  end

  # GET /subject_classes/1
  # GET /subject_classes/1.json
  def show
    @students = Student.all.order("name")
  end

  # GET /subject_classes/new
  def new
    instructor = Instructor.find(session[:id])
    @subject_class = SubjectClass.new(instructor_id: instructor.id)
    @subjects = Subject.all
    @instructors = Instructor.all
  end

  # GET /subject_classes/1/edit
  def edit
    @subjects = Subject.all
    @instructors = Instructor.all 
  end

  # POST /subject_classes
  # POST /subject_classes.json
  def create
    @subject_class = SubjectClass.new(subject_class_params)

    respond_to do |format|
      if @subject_class.save
        format.html { redirect_to @subject_class, notice: 'Subject class was successfully created.' }
        format.json { render :show, status: :created, location: @subject_class }
      else
        format.html { render :new }
        format.json { render json: @subject_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_classes/1
  # PATCH/PUT /subject_classes/1.json
  def update
    respond_to do |format|
      if @subject_class.update(subject_class_params)
        format.html { redirect_to @subject_class, notice: 'Subject class was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject_class }
      else
        format.html { render :edit }
        format.json { render json: @subject_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_classes/1
  # DELETE /subject_classes/1.json
  def destroy
    @subject_class.destroy
    respond_to do |format|
      format.html { redirect_to subject_classes_url, notice: 'Subject class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def add_student
    student = Student.find(params[:student_id])
    
    if @subject_class.students.where(id: student.id).size == 0    
      @subject_class.students << student
      
      @subject_class.tests.each do |test|
        TestResult.create(score: 0, test_id: test.id, student_id: student.id)
      end
      

      redirect_to @subject_class, notice: "added successfully"
    else
      redirect_to @subject_class, notice: student.name + " is already belongs to the class"
    end 
    
    
  end

  def remove_student
    student = Student.find(params[:student_id])
    subject_enrolled = ClassEnrollment.all.where(student_id: student.id, subject_class_id: @subject_class.id).first
    subject_enrolled.destroy
    redirect_to @subject_class, notice: subject_enrolled.student.name + " was removed from " + subject_enrolled.subject_class.subject.name + " class"
  end

  def attendances
    
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_class
      @subject_class = SubjectClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_class_params
      params.require(:subject_class).permit(:subject_id, :instructor_id, :days, :start_time, :end_time, :block, :school_year, :sem, :room)
    end

    def attendance_class_params
      params.permit(:comments, :date_created)
    end
end
