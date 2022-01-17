class Feeds::PhotosController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @photos = Photo.includes(:user, :picture).in_public.where(user_id: current_user.followings).or(Photo.includes(:user, :picture).in_public.where(user_id: current_user.id))
    # @photos_curr = current_user.photos.includes(:user, :picture).in_public
    # @photos = @photos_following + @photos_curr
    # @photos
  end
end
