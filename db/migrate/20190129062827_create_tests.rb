class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :name
      t.integer :test_type_id
      t.timestamp :schedule
      t.boolean :is_online
      t.integer :no_of_items
      t.integer :subject_class_id

      t.timestamps
    end
  end
end
