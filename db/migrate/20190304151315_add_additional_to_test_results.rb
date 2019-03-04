class AddAdditionalToTestResults < ActiveRecord::Migration[5.2]
  def change
    add_column :test_results, :status, :string
    add_column :test_results, :last_time_online, :timestamp
    add_column :test_results, :time_finished, :timestamp
  end
end
