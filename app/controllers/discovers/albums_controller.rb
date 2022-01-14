class Discovers::AlbumsController < ApplicationController
  ALBUMS_PER_PAGE = 6

  def index 
    @albums = Album.in_public.includes(:user, :pictures).page(params[:page]).per(ALBUMS_PER_PAGE)
  end
end
