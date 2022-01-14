class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.boolean :is_private, default: false
      t.timestamps
    end
  end
end
