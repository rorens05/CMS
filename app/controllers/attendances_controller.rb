class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  layout 'admin'
  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:date_created, :comment, :subject_class_id)
    end
end
