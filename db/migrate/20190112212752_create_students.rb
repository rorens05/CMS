class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :user_id
      t.string :student_no
      t.string :course
      t.string :curriculum_year
      t.integer :year
      t.integer :year_enrolled

      t.timestamps
    end
  end
end
