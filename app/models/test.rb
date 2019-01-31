class Test < ApplicationRecord
  belongs_to :subject_class
  belongs_to :test_detail, foreign_key: "test_type_id"
  has_many :test_results
end
