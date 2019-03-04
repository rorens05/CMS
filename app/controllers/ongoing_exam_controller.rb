class OngoingExamController < ApplicationController

  layout 'exam'

  def start_exam
    @test = Test.find(params[:id])
  end

  def exam
  end
end
