class CreateClassEnrollments < ActiveRecord::Migration[5.2]
  def up
    create_table :class_enrollments do |t|
      t.integer "student_id"
      t.integer "subject_class_id"
      t.timestamps
    end
    add_index(:class_enrollments, ["student_id", "subject_class_id"])
  end

  def down 
    drop_table :class_enrollments
  end
end
