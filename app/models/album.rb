class Album < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, length: { maximum: 140 }
  validates :description, length: { maximum: 300 }

  belongs_to :user

  has_many :pictures, as: :pictureable, dependent: :destroy
  accepts_nested_attributes_for :pictures

  scope :in_public, -> { where(is_private: false) }
  
  # mount_uploader :photo_urls, AlbumUploader
end
