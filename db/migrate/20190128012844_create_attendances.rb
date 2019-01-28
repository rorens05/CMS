class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.date :date_created
      t.text :comment
      t.integer :subject_class_id

      t.timestamps
    end
  end
end
