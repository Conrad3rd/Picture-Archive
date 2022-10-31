class PicturehashController < ApplicationController
  require "pagy/extras/bootstrap"
  Pagy::DEFAULT[:items] = 40
  Pagy::DEFAULT[:size] = [8, 8, 8, 8]

  def index
    @asdf = []
    PicturesHashtag.where(hashtag_id: params[:id]).each do |asd|
      @asdf << asd.picture_id
    end

    @pictures = ActiveStorage::Attachment.where(record_type: "User").and(ActiveStorage::Attachment.where(blob_id: @asdf))
    @pagy, @records = pagy(@pictures)
    @pictures_count = @pictures.count
  end

  def remove
    @del = PicturesHashtag.where(id: params[:id])
    @id = @del.pluck("picture_id")
    @del.destroy_all

    redirect_to picture_path(@id), notice: "Hashtag was successfully removed."
  end

  def add
    @add = PicturesHashtag.create(hashtag_id: params[:hashtag_id], picture_id: params[:picture_id])
    redirect_to picture_path(params[:picture_id]), notice: "Hashtag was successfully added."
  end
end
