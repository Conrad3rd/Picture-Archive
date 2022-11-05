class PicturesController < ApplicationController
  # before_action :set_upload, only: %i[ show edit update destroy ]
  require "pagy/extras/bootstrap"
  Pagy::DEFAULT[:items] = 50
  # Pagy::DEFAULT[:size] = [1, 1, 1, 1]
  Pagy::DEFAULT[:size] = [8, 8, 8, 8]
  # GET /pictures or /pictures.json
  # @pictures = ActiveStorage::Attachment.where(record_type: "User").and(ActiveStorage::Attachment.where(blob_id: @existing_pics))

  def index
    # @pictures_count = ActiveStorage::Attachment.where(record_type: "User").count
    # @pictures = ActiveStorage::Attachment.where(record_type: "User")

    if params[:query].present?

      @hash_id = Hashtag.where(name: params[:query])

      @existing_pics = []
      PicturesHashtag.where(hashtag_id: @hash_id).each do |asd|
        @existing_pics << asd.picture_id
      end

      @pictures = ActiveStorage::Attachment
                  .where(record_type: "User")
                  .and(ActiveStorage::Attachment.where(blob_id: @existing_pics))

    else
      @pictures = ActiveStorage::Attachment.where(record_type: "User")
    end
    @pagy, @records = pagy(@pictures)
  end

  def show
    @picture = ActiveStorage::Attachment.where(name: "pictures")
    @picture = @picture.find(params[:id])

    @picture_info = Picture.find(params[:id])
    @hashtags_set = PicturesHashtag.where(picture_id: params[:id])

    @hashtags_add = Hashtag.where(name: ["nicht Myanmar", "Pferd", "Was ist das?", "Myanmar", "Markt", "Brücke", "Wasser", "unscharf", "Farbe", "Yangon", "Text", "Tier", "SW", "Unabhängigkeitsdenkmal"])
    # @hashtags_add = Hashtag.all

    @size = ActiveStorage::Blob.find(params[:id])

    # params[:hash_id]
    @existing_pics = []
    PicturesHashtag.where(hashtag_id: params[:hash_id]).each do |asd|
      @existing_pics << asd.picture_id
    end
    # ActiveStorage::Attachment.where(record_type: "User")
    @hash = PicturesHashtag.where(hashtag_id: params[:hash_id])

    @hashs = ActiveStorage::Attachment
             .where(record_type: "User")
             .and(ActiveStorage::Attachment.where(blob_id: @existing_pics))

    @hashname = Hashtag.where(id: params[:hash_id])

    @find_hash = Hashtag.all

    @pic_list = []
    @hashs.each do |aa|
      @pic_list << aa.id
    end

    @pic_list
  end


  def add
    if params[:form] == "true"
      @hash_id = Hashtag.where(name: params[:hashtag_id]).ids
      if @hash_id[0].nil?
        Hashtag.create(name: params[:hashtag_id])
        @hash_id = Hashtag.where(name: params[:hashtag_id]).ids
      end
      @add = PicturesHashtag.create(hashtag_id: @hash_id[0], picture_id: params[:picture_id])
    else
      @add = PicturesHashtag.create(hashtag_id: params[:hashtag_id], picture_id: params[:picture_id])
    end

    if @add.save
      redirect_to picture_path(params[:picture_id], hash_id: params[:hash_id]), notice: "Hashtag was successfully added."
    else
      redirect_to picture_path(params[:picture_id], hash_id: params[:hash_id]), alert: "Hashtag already added."
    end
  end

  def remove
    @del = PicturesHashtag.where(id: params[:id])
    @id = @del.pluck("picture_id")
    @del.destroy_all

    redirect_to picture_path(@id, params[:picture_id], hash_id: params[:hash_id]), notice: "Hashtag was successfully removed."
  end
end
