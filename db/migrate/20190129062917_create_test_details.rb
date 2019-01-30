class CreateTestDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :test_details do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
