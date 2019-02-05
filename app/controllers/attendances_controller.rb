class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy, :new_attendance]
  
  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all
    
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
    @attendance_details = @attendance.attendance_details  
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
    @subject_class = SubjectClass.find(params[:subject_class_id])
    @attendance.subject_class_id = @subject_class.id
  end

  # GET /attendances/1/edit
  def edit
    @subject_class = @attendance.subject_class
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)
    @subject_class = SubjectClass.find(params[:subject_class_id])
    @attendance.subject_class_id = @subject_class.id

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to attendances_subject_class_path(@subject_class), notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      @subject_class = SubjectClass.find(params[:subject_class_id])
      @attendance.subject_class_id = @subject_class.id
      if @attendance.update(attendance_params)
        format.html { redirect_to attendances_subject_class_path(@subject_class), notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_subject_class_path(@attendance.subject_class), notice: 'Attendance was successfully deleted.' }
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_attendance
    puts "destroying all existing attendances"

    @attendance.attendance_details.each do |ad|
      ad.destroy
      puts ad.student.name + " destroyed"
    end
    
    puts "looping attendances"
    count = 0
    @attendance.subject_class.students.each do |student|
      if params[student.student_no]
        attendance_detail = AttendanceDetail.new
        attendance_detail.student = student
        attendance_detail.attendance = @attendance
        if attendance_detail.save
          puts attendance_detail.student.name + " was saved"
        else
          puts "error"
        end
      end
    end 
    redirect_to @attendance, notice: "Attendance Updated"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
      if session[:type] == "2"
        if @attendance.subject_class.instructor_id.to_s != session[:id].to_s
          redirect_to "/404.html"
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:date_created, :comment, :subject_class_id)
    end
end
