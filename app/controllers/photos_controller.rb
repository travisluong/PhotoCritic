class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def index
    offset = 1
    if params[:page]
      page = params[:page].to_i
      offset = 5 * (page - 1)
    end
    @photos = current_user.photos.limit(5).offset(offset).reverse_order
    respond_to do |format|
      format.json { render json: @photos, each_serializer: PhotoSerializer }
      format.html { render :template => 'home/index'}
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @photo }
      format.html { render :template => 'home/index'}
    end
  end

  def new
    @photo = Photo.new
    respond_to do |format|
      format.json { render json: @photo }
      format.html { render :template => 'home/index'}
    end
  end

  def edit
    respond_to do |format|
      format.html { render :template => 'home/index'}
    end
  end

  def create
    @photo = current_user.photos.new(photo_params)
    @photo.save
    # respond_with(@photo)
    respond_to do |format|
      format.json { render json: @photo }
      format.html { render :template => 'home/index'}
    end
  end

  def update
    @photo.update(photo_params)
    respond_to do |format|
      format.json { render json: @photo }
      format.html { render :template => 'home/index'}
    end
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.json { render json: @photo }
      format.html { render :template => 'home/index'}
    end
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:title, :image)
    end
end
