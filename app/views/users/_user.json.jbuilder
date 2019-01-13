json.extract! user, :id, :username, :password_digest, :user_type, :first_name, :last_name, :middle_name, :email, :contact_no, :address, :gender, :birthday, :image, :created_at, :updated_at
json.url user_url(user, format: :json)
