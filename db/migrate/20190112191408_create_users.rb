class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :user_type
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :email
      t.string :contact_no
      t.string :address
      t.string :gender
      t.date :birthday
      t.string :image

      t.timestamps
    end
  end
end
