class UsersController < ApplicationController
  # before_action :get_user, only: [:show]
  before_action :authenticate_user!
  
  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    @photos = @user.photos
    @albums = @user.albums
    @followings = @user.followings
    @followers = @user.followers
    
  end

  

  private
  def get_user
    @user = User.find(params[:id])
  end

end
