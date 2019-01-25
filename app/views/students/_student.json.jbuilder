json.extract! student, :id, :student_no, :first_name, :middle_name, :last_name, :email, :contact_no, :curriculum_year, :year, :course, :year_enrolled, :gender, :birthday, :created_at, :updated_at
json.url student_url(student, format: :json)
