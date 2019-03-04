class OngoingExamController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:get_exam_result]
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
end
