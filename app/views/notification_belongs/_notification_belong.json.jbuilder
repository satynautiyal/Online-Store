json.extract! notification_belong, :id, :readed, :user_id, :notification_id, :created_at, :updated_at
json.url notification_belong_url(notification_belong, format: :json)
