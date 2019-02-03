class User < ApplicationRecord
  has_secure_password
  has_one_attached :image
  validates :username, presence: true
  validates :first_name, presence: true
  validates :image, presence: true
  validates :email, presence: true
  validates :user_type, presence: true

  scope :admins, lambda {where(user_type: "ADMIN")}
  scope :students, lambda {where(user_type: "STUDENT")}
  scope :instructors, lambda {where(user_type: "INSTRUCTORS")}

  def name
    self.first_name
  end
end
