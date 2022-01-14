class AddFieldsToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :photo_url, :string
    add_reference :photos, :user, foreign_key: true
  end
end
