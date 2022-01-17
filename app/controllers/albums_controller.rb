class AlbumsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_album, only: [:edit, :update, :destroy]

  def new
    @album = current_user.albums.new
    @album.pictures.new
  end

  def create
    @album = current_user.albums.new(album_params)
    # @album.valid?
    # puts @album.errors.full_messages
    # byebug

    if @album.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @album.update(album_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @album.destroy
    redirect_to root_path
  end


  private
  def album_params
    params.require(:album).permit(:title, :description, :is_private, pictures_attributes: [:id, :pictureable_id, :pictureable_type, :picture_url, :_delete])
  end

  def find_album
    @album = Album.find(params[:id])
  end
end
