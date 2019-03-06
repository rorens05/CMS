class Test < ApplicationRecord
  belongs_to :subject_class
  belongs_to :test_detail, foreign_key: "test_type_id"
  has_many :test_results, dependent: :destroy
  has_many :test_questions, dependent: :destroy
  validate :non_zero

  STATUS_LIST = ["Not Started", "Ongoing", "Ended"]
  validates :status, :inclusion=> { in: STATUS_LIST}

  def non_zero
    if self.no_of_items
      if self.no_of_items < 1
        self.errors.add(:no_of_items, " cannot be zero")
      end
    else
      self.errors.add(:no_of_items, " cannot be blank")
    end
  end
end
