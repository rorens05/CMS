class OngoingExamController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:get_exam_result, :update_test_status]
  layout 'exam'

  def start_exam
    @test = Test.find(params[:id])
  end

  def exam
  end

  def get_exam_results
    result = []
    TestResult.where(test_id: params[:id]).order("status desc").each do |tr|
      temp = tr.attributes
      temp[:name] = Student.find(tr.student_id).name
      result << temp
    end
    
    render json: {status: 'success', message: 'result loaded', data: result}, status: :ok

  end

  def update_test_status
    test = Test.find(params[:test_id])
    test.status = params[:status]
    if test.save
      render json: {status: 'success', message: 'Test status updated'}, status: :ok
    else
      render json: {status: 'success', message: test.errors.full_messages}, status: :ok
    end


  end
end
