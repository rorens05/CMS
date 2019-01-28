class Attendance < ApplicationRecord
  belongs_to :subject_class

  validates :date_created, presence: true
  validates :date_created, :uniqueness => true
end
