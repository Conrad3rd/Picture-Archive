class PicturesController < ApplicationController
  # before_action :set_upload, only: %i[ show edit update destroy ]
  require 'pagy/extras/bootstrap'
  Pagy::DEFAULT[:items] = 40
  Pagy::DEFAULT[:size]  = [8,8,8,8]
  # GET /pictures or /pictures.json
  $pictures_count = ActiveStorage::Attachment.where(record_type: "User").count

  def index
    @pictures = ActiveStorage::Attachment.where(record_type: "User")
    @pagy, @records = pagy(@pictures)
  end

  def show
    # @pictures_count = ActiveStorage::Attachment.where(record_type: "User").count
    # @picture = ActiveStorage::Attachment.find(params[:id])
    @picture = ActiveStorage::Attachment.where(name: "pictures")
    @picture = @picture.find(params[:id])

    @picture_info = Picture.find(params[:id])
    @hashtags_set = PicturesHashtag.where(picture_id: params[:id])

    @hashtags_add = Hashtag.all # .take(4)

  end
end
