class CreatePicture < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.bigint :pictureable_id
      t.string :pictureable_type
      t.timestamps
    end

    add_index :pictures, [:pictureable_id, :pictureable_type]
  end
end
