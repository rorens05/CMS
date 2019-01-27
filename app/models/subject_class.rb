class SubjectClass < ApplicationRecord
  belongs_to :subject
  belongs_to :instructor

  has_many :class_enrollments
  has_many :students, through: :class_enrollments


  def schedule
    self.days + " " + self.start_time.strftime("%l:%M %p")  + " - " + self.end_time.strftime("%l:%M %p") 
  end
end
