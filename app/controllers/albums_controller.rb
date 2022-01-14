class AlbumsController < ApplicationController

  before_action :authenticate_user!

  def new
    @album = current_user.albums.new
    @album.pictures.build
  end

  def create
    @album = current_user.albums.new(album_params)
    @album.valid?
    puts @album.errors.full_messages
    

    if @album.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def album_params
    params.permit(:title, :description, :is_private, pictures_attributes: [:pictureable_id, :pictureable_type, :picture_url])
  end
end
