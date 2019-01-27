class SubjectClass < ApplicationRecord
  belongs_to :subject
  belongs_to :instructor


  def schedule
    self.days + " " + self.start_time.strftime("%l:%M %p")  + " - " + self.end_time.strftime("%l:%M %p") 
  end
end
