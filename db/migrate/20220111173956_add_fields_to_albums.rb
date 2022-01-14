class AddFieldsToAlbums < ActiveRecord::Migration[6.1]
  def change
    add_column :albums, :photo_urls, :json
    add_reference :albums, :user, foreign_key: true
  end
end
