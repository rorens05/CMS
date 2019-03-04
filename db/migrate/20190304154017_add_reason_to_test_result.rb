class AddReasonToTestResult < ActiveRecord::Migration[5.2]
  def change
    add_column :test_results, :reason, :string
  end
end
