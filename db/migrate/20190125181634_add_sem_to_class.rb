class AddSemToClass < ActiveRecord::Migration[5.2]
  def change
    add_column :subject_classes, :sem, :string, after: :school_year
    add_column :subject_classes, :room, :string, after: :end_time
  end
end
