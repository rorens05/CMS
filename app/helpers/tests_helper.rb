module TestsHelper
  def getScore(test, student)
    found_test = TestResult.where(test_id: test.id, student_id: student.id).first
    if found_test
      found_test.score.to_s
    else
      "0"
    end
  end
end
