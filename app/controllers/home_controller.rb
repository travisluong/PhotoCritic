class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @photos = Photo.all
  end
end
