class TestResult < ApplicationRecord
  belongs_to :test
  belongs_to :student
  has_many :test_answers, dependent: :destroy

  STATUS_LIST = ["Online", "Offline", "Taking Exam", "Paused", "Prohibited", "Finished"]
  validates :status, :inclusion=> { in: STATUS_LIST}

  REASON_LIST = ["Changed Tab", "Change Window", "Close Tab", "Printscreen pressed", ""]
  validates :reason, :inclusion=> { in: REASON_LIST}
end
