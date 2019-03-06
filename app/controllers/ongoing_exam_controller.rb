class OngoingExamController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:get_exam_result, :update_test_status]
  skip_before_action :restrict_student, only: [:exam, :get_test_answer_sheet, :check_answer, :update_status]
  layout 'exam'

  def start_exam
    @test = Test.find(params[:id])
    @test_questions = @test.test_questions
    @test.test_results.each do |result|
      result.status = "Offline"
      result.save
    end

    if @test.status == "Not Started" && @test.test_results.first.test_answers.count == 0

      @test.test_results.each do |result|
        shuffled_tests = @test.test_questions.shuffle 
        shuffled_tests.each do |shuffled_test|        
          TestAnswer.create(test_result_id: result.id, test_question_id: shuffled_test.id )
        end
      end
    end
    
  end

  def get_test_answer_sheet
    models = TestAnswer.where(test_result_id: params[:id])
    questions = []
    
    models.each do |model|
      question = model.attributes
      question["question"] = model.test_question.question
      questions << question
    end
    
    render json: {status: 'success', message: 'result loaded', data: questions}, status: :ok

  end

  def exam
    @test = Test.find(params[:id])
    testResult = @test.test_results.where(student_id: session[:id]).first
    if testResult.status == TestResult::STATUS_LIST[5] || testResult.status == TestResult::STATUS_LIST[4] || testResult.status == TestResult::STATUS_LIST[3] 

    else 
      testResult.status = TestResult::STATUS_LIST[0]
    end
    testResult.save
    @testResult = testResult
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

  def update_status

    test_result = TestResult.find(params[:id])
    test_result.status = params[:status]
    test_result.reason = params[:reason]
    if test_result.save
      render json: {status: 'success', message: 'status updated'}, status: :ok
    else
      render json: {status: 'failed', message: test_result.errors.full_messages}, status: :ok
    end


  end

  def check_answer
    check = false
    score = 0
    testAnswer = TestAnswer.find(params[:id])
    testAnswer.answer = params[:answer]
    correctAnswer = testAnswer.test_question.answer
    puts("answer === " + params[:answer])
    puts("answer === " + correctAnswer)
    if testAnswer.answer == correctAnswer
      testAnswer.check = true
      check = true
    else
      testAnswer.check = false
      check = false
    end
    testAnswer.save
    result = testAnswer.test_result
    result.score = result.test_answers.where(check: true).count
    result.save
    score = result.score
    render json: {status: 'success', message: 'answer loaded', check: check, score: score}, status: :ok
    
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
