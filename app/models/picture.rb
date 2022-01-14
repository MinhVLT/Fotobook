class Picture < ApplicationRecord
  belongs_to :pictureable, polymorphic: true

  mount_uploader :picture_url, PictureUploader
  
end
