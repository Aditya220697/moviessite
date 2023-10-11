class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :short_title
      t.text :title
      t.string :thumbnail
      t.string :imdb_link
      t.string :genre
      t.string :rating
      t.string :short_description
      t.string :director
      t.string :creator
      t.string :actors
      t.string :date
      t.string :time
      t.string :language
      t.string :resolution
      t.text :story
      t.string :mobile_hd_download_link
      t.string :medium_hd_download_link
      t.string :full_hd_download_link
      t.string :trailer_link

      t.timestamps
    end
  end
end
