class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy,]
  before_action :set_subject_class, only: [:index, :new]

  # GET /tests
  # GET /tests.json
  def index
    if @subject_class
      
      @tests = Test.all.where(subject_class_id: @subject_class.id)

    else
      flash[:notice] = "invalid request"
    end
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    @subject_class = @test.subject_class
    @students = @test.subject_class.students.order(:name)
    @test_questions = @test.test_questions
    @test_question = TestQuestion.new
    @test_question.test_id = @test.id
  end

  # GET /tests/new
  def new
    @test = Test.new
    @test.subject_class_id = @subject_class.id
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)
    if @test.is_online  
      @test.status = "Not Started"  
    else
      @test.status = "Ended"      
    end
    respond_to do |format|
      if @test.save 

        @students = @test.subject_class.students #create student test result and set to zero to be edited by instructor
        
        @students.each do |student|
          result = TestResult.new(test_id: @test.id, student_id: student.id, score: 0, status: TestResult::STATUS_LIST[0], last_time_online: Date.today, time_finished: Date.today, reason: TestResult::REASON_LIST[3])
          if result.save
            puts "=============================================="
            puts "test result created"
            puts "=============================================="
          else
            puts "=============================================="
            puts result.errors.full_messages
            puts "=============================================="
            
          end
          
          
        end        

        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url(subject_class_id: @test.subject_class_id), notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_students_scores
    @test = Test.find(params[:id])
    @students = @test.subject_class.students.order(:name)
    
  end

  def update_students_scores
    @test = Test.find(params[:id])
    
    @test.subject_class.students.each do |student|      
      test_detail = TestResult.all.where(student_id: student.id, test_id: @test.id).first || TestResult.new(student_id: student.id, test_id: @test.id)
      test_detail.score = params[student.student_no].to_i
      if test_detail.save 
        puts "========================saved========================="
      end
    end

    flash[:notice] = "Result Updated Successfully!"
    redirect_to test_path(@test)
  end


  def import
    notice = TestQuestion.import(params[:file], params[:id])
    redirect_to '/tests/' + params[:id], notice: notice
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
      if session[:type] == "2"
        if @test.subject_class.instructor_id.to_s != session[:id].to_s
          redirect_to "/404.html"
        end
      end
    end

    def set_subject_class
      @subject_class = SubjectClass.find(params[:subject_class_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:name, :test_type_id, :schedule, :duration, :is_online, :no_of_items, :subject_class_id)
    end
end
