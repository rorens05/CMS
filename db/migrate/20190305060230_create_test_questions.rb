class CreateTestQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :test_questions do |t|
      t.references :test, foreign_key: true
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
