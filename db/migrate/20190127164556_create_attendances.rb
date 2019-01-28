class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.integer :subject_class_id
      t.date :date_created
      t.string :comments

      t.timestamps
    end
  end
end
