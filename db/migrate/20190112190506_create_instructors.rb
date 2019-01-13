class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.integer :user_id
      t.date :hire_date
      t.text :other_information

      t.timestamps
    end
  end
end
