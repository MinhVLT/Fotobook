class Feeds::PhotosController < ApplicationController
  PHOTOS_PER_PAGE = 6
  before_action :authenticate_user!

  def index
    @photos = Photo.includes(:user, :picture).in_public.where(user_id: current_user.followings).page(params[:page]).per(PHOTOS_PER_PAGE)
    # @photos_curr = current_user.photos.includes(:user, :picture)
    # @photos = @photos_following + @photos_curr
    # @photos
  end
end
