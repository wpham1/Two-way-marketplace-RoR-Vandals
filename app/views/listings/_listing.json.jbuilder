json.extract! listing, :id, :name, :description, :price, :size, :finish, :user_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
