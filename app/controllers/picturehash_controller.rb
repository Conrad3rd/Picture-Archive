class PicturehashController < ApplicationController
  def index
    @hashtags_have = PicturesHashtag.all.take(6)
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
