class AddAdditionalToTestResults < ActiveRecord::Migration[5.2]
  def change
    add_column :test_details, :status, :string
    add_column :test_details, :time_finished, :timestamp
  end
end
