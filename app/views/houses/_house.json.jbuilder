json.extract! house, :id, :name, :address, :price, :rooms, :bathrooms, :photo, :created_at, :updated_at
json.url house_url(house, format: :json)
