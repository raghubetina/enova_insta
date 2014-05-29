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
    p = Photo.find(params[:id])
    p.caption = params[:caption]
    p.image_url = params[:image_url]
    p.save

    redirect_to "http://localhost:3000/photos/#{p.id}"
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def new
  end

  def create
    p = Photo.new
    p.caption = params[:caption]
    p.image_url = params[:image_url]
    p.save

    redirect_to "http://localhost:3000/photos"
  end
end





