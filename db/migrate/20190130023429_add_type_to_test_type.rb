class AddTypeToTestType < ActiveRecord::Migration[5.2]
  def change
    add_column :test_details, :test_type, :string
  end
end
