class AttendanceDetail < ApplicationRecord
  belongs_to :student
  belongs_to :attendance
end
