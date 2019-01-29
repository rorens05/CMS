class CreateAttendanceDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :attendance_details do |t|
      t.integer :student_id
      t.integer :attendance_id

      t.timestamps
    end
  end
end
