class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :subject_code
      t.integer :year
      t.integer :units

      t.timestamps
    end
  end
end
