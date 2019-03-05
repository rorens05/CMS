json.extract! test_question, :id, :test_id, :question, :answer, :created_at, :updated_at
json.url test_question_url(test_question, format: :json)
