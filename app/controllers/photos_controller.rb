class PhotosController < ApplicationController
  
  before_action :authenticate_user!
  before_action :find_photo, only: [:edit, :update, :destroy]

  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    # @photo.valid?
    # puts @photo.errors.full_messages
    

    if @photo.save
      # @photo.picture.pictureable_id = @photo.id
      # @photo.picture.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    # @photo.valid?
    # puts @photo.errors.full_messages
    if @photo.picture && !@photo.picture.changed?
      if @photo.update(photo_params_without_picture)
        redirect_to root_path
      else
        render :edit, status: :unprocessable_entity
      end
    else
      if @photo.update(photo_params)
        redirect_to root_path
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @photo.destroy
    redirect_to root_path
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :description, :is_private, picture_attributes: [:pictureable_id, :pictureable_type, :picture_url])
  end

  def photo_params_without_picture
    params.require(:photo).permit(:title, :description, :is_private)
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end
end
