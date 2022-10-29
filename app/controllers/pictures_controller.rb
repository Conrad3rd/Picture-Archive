class PicturesController < ApplicationController
  # before_action :set_upload, only: %i[ show edit update destroy ]

  # GET /pictures or /pictures.json
  def index
    pages = 10
    @pictures = ActiveStorage::Attachment
                .where(record_type: "User")
                .take(pages)

    @pp = ActiveStorage::Attachment
          .where(record_type: "User")
          .and(ActiveStorage::Attachment
          .where("id > ?", pages))
          .take(4)

    # @picturess = Picture.all
    # @pictures = Picture.where("id < ?", 10)
    # @users = User.all
    # @user = User.find(params[:id])
  end

  def show
    @picture = ActiveStorage::Attachment.find(params[:id])

    @picture_info = Picture.find(params[:id])

    @hashtags = []
    PicturesHashtag.where(picture_id: @picture.id).each do |hashtag|
      @hashtags << hashtag.hashtag_id
    end

    @hashtags = Hashtag.where(id: @hashtags)
    # @hashtags_name = @hashtags.pluck("name")
    # @hashtags_id = @hashtags.pluck("id")
    @del = PicturesHashtag
           .where(hashtag_id: @hashtags)
           .and(PicturesHashtag
           .where(picture_id: params[:id]))
  end
end
