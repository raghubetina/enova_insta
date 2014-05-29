class PhotosController < ApplicationController
  def destroy
    p = Photo.find(params[:id])
    p.destroy

    redirect_to photos_url
  end

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.caption = params[:photo][:caption]
    @photo.image_url = params[:photo][:image_url]

    if @photo.save
      redirect_to @photo
    else
      render 'edit'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
    @photo.caption = params[:photo][:caption]
    @photo.image_url = params[:photo][:image_url]

    if @photo.save
      redirect_to photos_url
    else
      render 'new'
    end
  end
end





