class ChangeToPolymorphic < ActiveRecord::Migration[6.1]
  def change
    remove_column :photos, :photo_url, :string
    remove_column :albums, :photo_urls, :json
    remove_column :users, :avatar_url, :string
    add_column :pictures, :picture_url, :string
  end
end
