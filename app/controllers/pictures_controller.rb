class PicturesController < ApplicationController
  # before_action :set_upload, only: %i[ show edit update destroy ]

  # GET /pictures or /pictures.json
  def index
    # @pictures = Picture.all
    # @pictures = Picture.where("id < ?", 10)
    @users = User.all
  end

  def show
    @picture = Picture.find(params[:id])
    @user = Picture.where(id: @picture)
  end
end
