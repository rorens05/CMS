class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :student_no
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :contact_no
      t.integer :curriculum_year
      t.integer :year
      t.string :course
      t.integer :year_enrolled
      t.string :gender
      t.date :birthday

      t.timestamps
    end
  end
end
