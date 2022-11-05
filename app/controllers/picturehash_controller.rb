class PicturehashController < ApplicationController
  # require "pagy/extras/bootstrap"
  # Pagy::DEFAULT[:items] = 40
  # Pagy::DEFAULT[:size] = [8, 8, 8, 8]

  def index
    # @existing_pics = []
    # PicturesHashtag.where(hashtag_id: params[:id]).each do |asd|
    #   @existing_pics << asd.picture_id
    # end

    # @hashname = Hashtag.where(id: params[:id])

    # @pictures = ActiveStorage::Attachment.where(record_type: "User").and(ActiveStorage::Attachment.where(blob_id: @existing_pics))
    # @pagy, @records = pagy(@pictures)
    # @pictures_count = @pictures.count
  end

  def remove
    @del = PicturesHashtag.where(id: params[:id])
    @id = @del.pluck("picture_id")
    @del.destroy_all

    redirect_to picture_path(@id, params[:picture_id], hash_id: params[:hash_id]), notice: "Hashtag was successfully removed."
  end

  def add
    if params[:form] == "true"
      @hash_id = Hashtag.where(name: params[:hashtag_id]).ids
      if @hash_id[0].nil?
        Hashtag.create(name: params[:hashtag_id])
        @hash_id = Hashtag.where(name: params[:hashtag_id]).ids
        # hashtag_id = params[:hashtag_id]
        # puts "+++++++++++++++++++++++++++++++++++++"
      end
      # puts "\n#########################################"
      # puts "#{@hash_id[0].nil?} : #{@hash_id[0]}"
      # puts "#########################################\n\n"
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
end
