class PicturesController < ApplicationController
  # before_action :set_upload, only: %i[ show edit update destroy ]

  # GET /pictures or /pictures.json
  def index
    @pictures = Picture.all
    # @pictures = Picture.where("id < ?", 10)
    @users = User.all
    # @user = User.find(params[:id])
  end

  def show
    @picture = ActiveStorage::Attachment.find(params[:id])
    @p_info = Picture.find(params[:id])

    @pictures_hash = PicturesHashtag.where(picture_id: params[:id])
    @hashtag = PicturesHashtag.where(picture_id: params[:id])
    @hashtagg = Hashtag.all
  end
end
