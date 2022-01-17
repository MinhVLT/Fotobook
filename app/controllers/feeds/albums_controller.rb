class Feeds::AlbumsController < ApplicationController

  before_action :authenticate_user!

  def index
    @albums = Album.includes(:user, :pictures).in_public.where(user_id: current_user.followings)
  end
end
