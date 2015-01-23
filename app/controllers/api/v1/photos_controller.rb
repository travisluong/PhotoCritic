module Api
  module V1
    class PhotosController < ApplicationController
      acts_as_token_authentication_handler_for User
      before_action :set_photo, only: [:show, :edit, :update, :destroy]
      skip_before_action :verify_authenticity_token

      respond_to :json

      def index
        offset = 1
        if params[:page]
          page = params[:page].to_i
          offset = 5 * (page - 1)
        end
        @photos = Photo.all.limit(5).offset(offset).reverse_order
        respond_to do |format|
          format.json { render json: @photos, each_serializer: PhotoSerializer, meta: {total: current_user.photos.count} }
        end
      end

      def show
        respond_to do |format|
          format.json { render json: @photo }
        end
      end

      def new
        @photo = Photo.new
        respond_to do |format|
          format.json { render json: @photo }
        end
      end

      def edit
      end

      def create
        @photo = current_user.photos.new(photo_params)

        respond_to do |format|
          if @photo.save
            Delayed::Job.enqueue NewPhotoJob.new(@photo)
            format.json { render json: @photo }
          else
            format.json { render json: @photo.errors }
          end
        end
      end

      def update
        @photo.update(photo_params)
        respond_to do |format|
          format.json { render json: @photo }
        end
      end

      def destroy
        @photo.destroy
        respond_to do |format|
          format.json { render json: @photo }
        end
      end

      private
        def set_photo
          @photo = Photo.find(params[:id])
        end

        def photo_params
          params.require(:photo).permit(:title, :pic)
        end
    end
  end
end