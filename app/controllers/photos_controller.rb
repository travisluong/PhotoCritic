class PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html { render :template => 'home/index'}
    end
  end

  def show
    respond_to do |format|
      format.html { render :template => 'home/index'}
    end
  end

  def new
    respond_to do |format|
      format.html { render :template => 'home/index'}
    end
  end

  def edit
    respond_to do |format|
      format.html { render :template => 'home/index'}
    end
  end

  def create
    respond_to do |format|
      format.html { render :template => 'home/index'}
    end
  end

  def update
    respond_to do |format|
      format.html { render :template => 'home/index'}
    end
  end

  def destroy
    respond_to do |format|
      format.html { render :template => 'home/index'}
    end
  end
end
