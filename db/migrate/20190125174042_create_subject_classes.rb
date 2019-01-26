class CreateSubjectClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_classes do |t|
      t.integer :subject_id
      t.integer :instructor_id
      t.string :days
      t.time :start_time
      t.time :end_time
      t.integer :block
      t.string :school_year

      t.timestamps
    end
  end
end
