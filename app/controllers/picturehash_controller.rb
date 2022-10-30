class PicturehashController < ApplicationController
  def destroy
    @del = PicturesHashtag.where(id: params[:id])
    @id = @del.pluck("picture_id")
    @del.destroy_all

    redirect_to picture_path(@id), notice: "Hashtag was successfully removed."
  end

  def update
    @add = PicturesHashtag.create(hashtag_id: params[:hashtag_id], picture_id: params[:picture_id])
    redirect_to picture_path(params[:picture_id]), notice: "Hashtag was successfully removed."
  end
end
