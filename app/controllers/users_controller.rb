class UsersController < ApplicationController
  # before_action :get_user, only: [:show]
  before_action :authenticate_user!
  
  def show
    if params[:id]
      @user = User.find(params[:id])
      @photos = @user.photos.in_public.includes(:picture)
      @albums = @user.albums.in_public.includes(:pictures)
      @followings = @user.followings
      @followers = @user.followers
    else
      @user = current_user
      @photos = @user.photos.includes(:picture)
      @albums = @user.albums.includes(:pictures)
      @followings = @user.followings
      @followers = @user.followers
    end
    
    
  end

  

end
