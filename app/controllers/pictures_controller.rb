class PicturesController < ApplicationController
  # before_action :set_upload, only: %i[ show edit update destroy ]
  require 'pagy/extras/bootstrap'
  Pagy::DEFAULT[:items] = 40
  Pagy::DEFAULT[:size]  = [8,8,8,8]
  # GET /pictures or /pictures.json
  def index
    @pictures = ActiveStorage::Attachment
                .where(record_type: "User")

    @pagy, @records = pagy(@pictures)

  end

  def show
    @pictures_count = ActiveStorage::Attachment.where(record_type: "User").count
    @picture = ActiveStorage::Attachment.find(params[:id])

    @picture_info = Picture.find(params[:id])

    @hashtags = []
    #@hashtags_id = @hashtags
    @hashtags_id = PicturesHashtag.where(picture_id: @picture.id).each do |hashtag|
      @hashtags << hashtag.hashtag_id
    end

    #@hashtags_id = @hashtags_id.pluck("id")
    @hashtags = Hashtag.where(id: @hashtags)

    @hashtags_id = PicturesHashtag
           .where(hashtag_id: @hashtags)
           .and(PicturesHashtag
            .where(picture_id: params[:id]))


    @hashtags_id = @hashtags_id

    @del = PicturesHashtag.where(picture_id: params[:id])
    #@id = @del.pluck(picture_id)
  end
end
