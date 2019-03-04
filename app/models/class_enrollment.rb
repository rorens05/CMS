class ClassEnrollment < ApplicationRecord
  belongs_to :student
  belongs_to :subject_class

  # STATUS_LIST = ["Scheduled", "Ongoing", "Ended"]
  # validates :status, :inclusion=> { in: STATUS_LIST}
end
