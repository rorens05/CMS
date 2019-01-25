class AddPositionToInstructor < ActiveRecord::Migration[5.2]
  def change
    add_column :instructors, :position, :string
  end
end
