class CreateTestAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :test_answers do |t|
      t.references :test_result, foreign_key: true
      t.references :test_question, foreign_key: true
      t.text :answer
      t.boolean :check

      t.timestamps
    end
  end
end
