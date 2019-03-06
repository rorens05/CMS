json.extract! test_answer, :id, :test_result_id, :test_question_id, :answer, :check, :created_at, :updated_at
json.url test_answer_url(test_answer, format: :json)
