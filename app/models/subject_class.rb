class SubjectClass < ApplicationRecord
  belongs_to :subject
  belongs_to :instructor

  has_many :subject_classes

  def schedule
    self.days + " " + self.start_time.strftime("%l:%M %p")  + " - " + self.end_time.strftime("%l:%M %p") 
  end
end
