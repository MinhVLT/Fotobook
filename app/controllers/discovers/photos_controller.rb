class Discovers::PhotosController < ApplicationController
  
  def index
    @photos = Photo.in_public.includes(:user, :picture)
  end
end
