class Discovers::PhotosController < ApplicationController
  PHOTOS_PER_PAGE = 6
  
  def index
    @photos = Photo.in_public.includes(:user, :picture).page(params[:page]).per(PHOTOS_PER_PAGE)
  end
end
