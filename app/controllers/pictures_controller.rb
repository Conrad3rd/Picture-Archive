class PicturesController < ApplicationController
  # before_action :set_upload, only: %i[ show edit update destroy ]

  # GET /pictures or /pictures.json
  def index

    @pic_count = Picture.count
    @pic_all = Picture.ids


    # @pictures = Picture.all
    @pictures = Picture.where("id < ?", 10)

    @atta_count = ActiveStorage::Attachment.count
    @atta_show = ActiveStorage::Attachment.all


    # User.joins(:posts, :account)

    @sas = ActiveStorage::Attachment.select `&:picture`

    @zwei = ActiveStorage::Attachment.joins(pictures: [:path])

    @users = User.all

    # @hashtag = ActiveRecord::Base.connection.execute("SELECT id, name FROM hashtags WHERE id IN (SELECT hashtag_id FROM pictures_hashtags WHERE picture_id = 1);").to_a

    @pic_all.each do |id|
      # @hashtag = ActiveRecord::Base.connection.execute("SELECT id, name FROM hashtags WHERE id IN (SELECT hashtag_id FROM pictures_hashtags WHERE picture_id = #{id});").to_a
    end
  end

  def show
    @picture = Picture.find(params[:id])
    # @user = User.find(params[:id])
    # @user = User.find(params[:user_id])
    @user = Picture.where(id: @picture)
    # @picture = User.find(params[:id])
    # @upload = Upload.find(params[:id])
    # @picturee = @picture.where(record_id: @picture)

  end



end


# active_employees = Employee.where(status: "active")
# active_employees.select do |employee|
#   employee.company.verified?
# end
