json.extract! product_service, :id, :name, :description, :time, :price, :created_at, :updated_at
json.url product_service_url(product_service, format: :json)
