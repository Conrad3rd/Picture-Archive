class PicturehashController < ApplicationController
  def destroy

    # @hashtags_name = @hashtags.pluck("name")
    # @hashtags_id = @hashtags.pluck("id")
    # @del = PicturesHashtag
    #        .where(hashtag_id: @hashtags)
    #        .and(PicturesHashtag
    #         .where(picture_id: params[:id]))
    @del = PicturesHashtag.where(id: params[:id])
    @id = @del.pluck("picture_id")
    @del.destroy_all

    redirect_to picture_path(@id), notice: "Hashtag was successfully removed."


            #@del.destroy(id: 255)
  end
end
