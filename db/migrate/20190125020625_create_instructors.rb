class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :email
      t.string :contact_no
      t.string :address
      t.string :gender
      t.date :birthday
      t.text :other_information

      t.timestamps
    end
  end
end
