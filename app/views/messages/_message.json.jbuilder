json.extract! message, :id, :summary, :body, :created_at, :updated_at
json.url message_url(message, format: :json)
