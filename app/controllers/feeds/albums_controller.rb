class Feeds::AlbumsController < ApplicationController
  ALBUMS_PER_PAGE = 6

  before_action :authenticate_user!

  def index
    @albums = Album.includes(:user, :pictures).in_public.where(user_id: current_user.followings).page(params[:page]).per(ALBUMS_PER_PAGE)
  end
end
