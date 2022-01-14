class Photo < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, length: { maximum: 140 }
  validates :description, length: { maximum: 300 }
  # validate :photo_size_validation
  
  belongs_to :user
  has_one :picture, as: :pictureable, dependent: :destroy

  accepts_nested_attributes_for :picture

  scope :in_public, -> { where(is_private: false) }
  # mount_uploader :photo_url, PhotoUploader

  # def photo_size_validation
  #   if photo_url.size > 5.megabytes
  #     errors.add(:base, "Image must be less than 5Mb")
  #   end
  # end
end
