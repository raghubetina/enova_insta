class PhotosController < ApplicationController
  before_action :set_photo, :only => [:show, :edit, :update, :destroy]

  def destroy
    @photo.destroy

    redirect_to photos_url
  end

  def index
    @photos = Photo.all
  end

  def show
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo
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

    if @photo.save
      redirect_to photos_url
    else
      render 'new'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :image_url)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end





