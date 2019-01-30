class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  before_action :set_subject_class, only: [:index, :new]

  layout 'admin'
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

    respond_to do |format|
      if @test.save
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    def set_subject_class
      @subject_class = SubjectClass.find(params[:subject_class_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:name, :test_type_id, :schedule, :is_online, :no_of_items, :subject_class_id)
    end
end
