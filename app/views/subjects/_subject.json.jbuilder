json.extract! subject, :id, :name, :subject_code, :year, :units, :created_at, :updated_at
json.url subject_url(subject, format: :json)
