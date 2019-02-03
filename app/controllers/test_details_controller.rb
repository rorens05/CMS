class TestDetailsController < ApplicationController
  before_action :set_test_detail, only: [:show, :edit, :update, :destroy]
  before_action :admin_only

  # GET /test_details
  # GET /test_details.json
  def index
    @test_details = TestDetail.all
  end

  # GET /test_details/1
  # GET /test_details/1.json
  def show
  end

  # GET /test_details/new
  def new
    @test_detail = TestDetail.new
  end

  # GET /test_details/1/edit
  def edit
  end

  # POST /test_details
  # POST /test_details.json
  def create
    @test_detail = TestDetail.new(test_detail_params)

    respond_to do |format|
      if @test_detail.save
        format.html { redirect_to @test_detail, notice: 'Test detail was successfully created.' }
        format.json { render :show, status: :created, location: @test_detail }
      else
        format.html { render :new }
        format.json { render json: @test_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_details/1
  # PATCH/PUT /test_details/1.json
  def update
    respond_to do |format|
      if @test_detail.update(test_detail_params)
        format.html { redirect_to @test_detail, notice: 'Test detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_detail }
      else
        format.html { render :edit }
        format.json { render json: @test_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_details/1
  # DELETE /test_details/1.json
  def destroy
    @test_detail.destroy
    respond_to do |format|
      format.html { redirect_to test_details_url, notice: 'Test detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_detail
      @test_detail = TestDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_detail_params
      params.require(:test_detail).permit(:name, :description)
    end
end
