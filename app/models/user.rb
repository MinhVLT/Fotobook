class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_commit :add_default_avatar, on:[:create]

  validates :first_name, :last_name, :email, :password, presence: true
  validates :first_name, length: { maximum: 25 }
  validates :last_name, length: { maximum: 25 }
  validates :email, length: { maximum: 255 }, uniqueness: true
  validates :password, length: { maximum: 64 }

  has_many :photos, dependent: :destroy
  has_many :albums,dependent: :destroy

  has_one :avatar, as: :pictureable, class_name: 'Picture', dependent: :destroy
  accepts_nested_attributes_for :avatar

  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships

  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
  
  # mount_uploader :avatar_url, AvatarUploader

  def short_name
    return "#{self.first_name.split(' ')[0]}  #{self.last_name.split(' ')[0]}"
  end

  def add_default_avatar
    #generate default avatar
    MiniMagick::Tool::Convert.new do |image|
      image.size "150x150"
      image.gravity "center"
      image.xc "#ffffff"
      image.pointsize 100
      image.fill "#4267B2"
      image.draw "text 0,0 #{first_name[0]}#{last_name[0]}"
      image << Rails.root.join("public", "uploads", "#{id}_default.jpg")
    end

    #attach default avatar
    # path = File.join(Rails.root, 'public/uploads/', "#{id}_default.jpg")
    # File.open(path) do |f|
    #   avatar_url = f
    # end
    
end
end
