class PhotosController < ApplicationController
  before_action :set_photo, :only => [:show, :edit, :update, :destroy]

  before_action :signed_in_user_must_be_owner, :only => [:edit, :update, :destroy]

  def signed_in_user_must_be_owner
    if @photo.user != current_user
      redirect_to root_url, :alert => "Nice try, suckah"
    end
  end

  def wall
    @photos = current_user.own_photos
    render 'index'
  end

  def timeline
    @photos = current_user.timeline
    render 'index'
  end

  def favorites
    @photos = current_user.favorite_photos
    render 'index'
  end

  def destroy
    @photo.destroy

    redirect_to photos_url, :notice => "Photo was destroyed."
  end

  def index
    @photos = Photo.all

    respond_to do |format|
      format.html
      format.json { render :json => @photos }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render :json => @photo }
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo, :notice => "Photo was updated successfully."
    else
      render 'edit'
    end
  end

  def edit
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user

    if @photo.save
      redirect_to photos_url, :notice => "Photo was created successfully."
    else
      render 'new'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :image_url, :image)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end





