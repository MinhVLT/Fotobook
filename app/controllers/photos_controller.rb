class PhotosController < ApplicationController
  
  before_action :authenticate_user!

  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    @photo.valid?
    puts @photo.errors.full_messages
    

    if @photo.save
      # @photo.picture.pictureable_id = @photo.id
      # @photo.picture.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :description, :is_private, picture_attributes: [:pictureable_id, :pictureable_type, :picture_url])
  end
end
