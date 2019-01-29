class Attendance < ApplicationRecord
  belongs_to :subject_class
  has_many :attendance_details
  validates :date_created, presence: true
  validate :validate_date_uniqueness
  # validates :date_created, :uniqueness => true



  def validate_date_uniqueness()
    self.subject_class.attendances.each do |at|
      if self.date_created == at.date_created
        errors.add(:date, "already existed")
      end
    end   
  end
end
