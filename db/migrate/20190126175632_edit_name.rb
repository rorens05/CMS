class EditName < ActiveRecord::Migration[5.2]
  def up   
    remove_column "students", :first_name
    remove_column "students", :last_name
    remove_column "students", :middle_name
    add_column "students", :name, :string 
  end

  def down 
    add_column "students", :first_name, :string 
    add_column "students", :last_name, :string 
    add_column "students", :middle_name, :string 
    remove_column "students", :name
  end
end
