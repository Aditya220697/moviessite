json.extract! image, :id, :movie_id, :url, :created_at, :updated_at
json.url image_url(image, format: :json)
