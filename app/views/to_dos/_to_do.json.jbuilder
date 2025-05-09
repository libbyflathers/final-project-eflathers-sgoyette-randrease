json.extract! to_do, :id, :title, :category_id, :completed, :priority, :user_id, :created_at, :updated_at
json.url to_do_url(to_do, format: :json)
