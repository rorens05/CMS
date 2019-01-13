class User < ApplicationRecord
  has_secure_password
  has_one_attached :image
  validates :username, presence: true
  validates :image, presence: true
  validates :email, presence: true

  scope :admins, lambda {where(user_type: "ADMIN")}
  scope :students, lambda {where(user_type: "STUDENT")}
  scope :instructors, lambda {where(user_type: "INSTRUCTORS")}
end
