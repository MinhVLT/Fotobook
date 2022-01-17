class Discovers::AlbumsController < ApplicationController

  def index 
    @albums = Album.in_public.includes(:user, :pictures)
  end
end
