json.extract! test_detail, :id, :name, :description, :created_at, :updated_at
json.url test_detail_url(test_detail, format: :json)
