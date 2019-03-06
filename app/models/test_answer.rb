class TestAnswer < ApplicationRecord
  belongs_to :test_result
  belongs_to :test_question
end
