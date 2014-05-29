class PhotosController < ApplicationController
  def destroy
    p = Photo.find(params[:id])
    p.destroy

    redirect_to "http://localhost:3000/photos"
  end

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.caption = params[:caption]
    @photo.image_url = params[:image_url]

    if @photo.save
      redirect_to "http://localhost:3000/photos/#{@photo.id}"
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
    @photo.caption = params[:caption]
    @photo.image_url = params[:image_url]

    if @photo.save
      redirect_to "http://localhost:3000/photos"
    else
      render 'new'
    end
  end
end





