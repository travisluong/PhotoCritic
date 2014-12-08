module Api
  module V1
    class PhotosController < ApplicationController

      respond_to :json

      def index
        offset = 1
        if params[:page]
          page = params[:page].to_i
          offset = 5 * (page - 1)
        end
        @photos = Photo.all.limit(5).offset(offset).reverse_order
        respond_to do |format|
          format.json { render json: @photos, each_serializer: PhotoSerializer }
        end
      end
    end
  end
end