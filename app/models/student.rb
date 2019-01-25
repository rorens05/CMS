class Student < ApplicationRecord
  has_secure_password
  has_one_attached :image


  def name 
    middle_initial = self.middle_name.size > 0 ? self.middle_name[0] + ". " : ""
    self.first_name + " " + middle_initial + self.last_name
  end
end
