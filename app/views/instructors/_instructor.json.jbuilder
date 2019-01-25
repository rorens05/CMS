json.extract! instructor, :id, :username, :password_digest, :name, :email, :contact_no, :address, :gender, :birthday, :other_information, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
