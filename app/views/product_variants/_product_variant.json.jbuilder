json.extract! product_variant, :id, :batch_no, :weight, :price, :quantity, :expiry, :product_id, :created_at, :updated_at
json.url product_variant_url(product_variant, format: :json)
