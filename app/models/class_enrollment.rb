class ClassEnrollment < ApplicationRecord
  belongs_to :student
  belongs_to :subject_class
end
