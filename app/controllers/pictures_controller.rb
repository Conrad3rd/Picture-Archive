class PicturesController < ApplicationController
  # before_action :set_upload, only: %i[ show edit update destroy ]

  # GET /pictures or /pictures.json
  def index
    @pictures = ActiveStorage::Attachment.where(record_type: "User").take(400)
    # @picturess = Picture.all
    # @pictures = Picture.where("id < ?", 10)
    # @users = User.all
    # @user = User.find(params[:id])
  end

  def show
    @picture = ActiveStorage::Attachment.find(params[:id])
    @prev = @picture.id
    @next = @picture.id

    @picture_info = Picture.find(params[:id])

    @hashtags = []
    PicturesHashtag.where(picture_id: @picture.id).each do |hashtag|
      @hashtags << hashtag.hashtag_id
    end

    @hashtags = Hashtag.where(id: @hashtags)
  end
end
