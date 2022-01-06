json.extract! product_view, :id, :viewable_id, :viewable_type, :user_ip, :created_at, :updated_at
json.url product_view_url(product_view, format: :json)
