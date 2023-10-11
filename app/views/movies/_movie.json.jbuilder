json.extract! movie, :id, :short_title, :title, :thumbnail, :genre, :rating, :short_description, :director, :creator, :actors, :date, :time, :language, :resolution, :story, :download_link, :trailer_link, :created_at, :updated_at
json.url movie_url(movie, format: :json)
