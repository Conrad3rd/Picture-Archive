class PicturesController < ApplicationController
  # before_action :set_upload, only: %i[ show edit update destroy ]
  require "pagy/extras/bootstrap"
  Pagy::DEFAULT[:items] = 50
  # Pagy::DEFAULT[:size] = [1, 1, 1, 1]
  Pagy::DEFAULT[:size] = [8, 8, 8, 8]
  # GET /pictures or /pictures.json
  $pictures_count = ActiveStorage::Attachment.where(record_type: "User").count
  # @pictures = ActiveStorage::Attachment.where(record_type: "User").and(ActiveStorage::Attachment.where(blob_id: @existing_pics))

  def index
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

    # if @pictures
    #   #@pictures = ActiveStorage::Attachment.where(record_type: "User")
    #   @pagy, @records = pagy(@pictures)
    # else
    #   @pictures = ActiveStorage::Attachment.where(record_type: "User")
    #   @pagy, @records = pagy(@pictures)
    # end

    # unless @pictures
    #   @pictures = ActiveStorage::Attachment.where(record_type: "User")
    # end

    # ActiveStorage::Attachment.where(record_type: "User")
    # @hash = PicturesHashtag.where(hashtag_id: params[:hash_id])
  end

  def show
    # @pictures_count = ActiveStorage::Attachment.where(record_type: "User").count
    # @picture = ActiveStorage::Attachment.find(params[:id])
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
    # @pagyy, @records = pagy(@hash)

    # #@nav = next_element(params[:id], params[:hash_id])
    # img_ids = %i[96 111 141 392 436]

    # @hash.each_with_index do |element, index|
    #   if element.to_s.to_i == 141
    #     @nav = "#{index} yes"
    #   end
    # end
  #   @pic_id = params[:id]

  #   @teee = next_element(img_ids, @pic_id)
  # end

  # def next_element(elements, current_pic_id)
  #   elements.each_with_index { |element, index|
  #     element = element.to_s.to_i
  #     if element === current_pic_id
  #       @navv_yes = "Index = #{index}, current_pic_id = #{current_pic_id}, element = #{element.class}"
  #     else
  #       @navv_no = "Index = #{index}, current_pic_id = #{current_pic_id}, element = #{element.class}"

  #     end
  #   }
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

  def remove
    @del = PicturesHashtag.where(id: params[:id])
    @id = @del.pluck("picture_id")
    @del.destroy_all

    redirect_to picture_path(@id, params[:picture_id], hash_id: params[:hash_id]), notice: "Hashtag was successfully removed."
  end


end
