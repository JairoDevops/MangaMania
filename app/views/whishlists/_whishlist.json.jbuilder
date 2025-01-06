json.extract! whishlist, :id, :total, :user_id, :product_id, :created_at, :updated_at
json.url whishlist_url(whishlist, format: :json)
