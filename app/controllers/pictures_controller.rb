class PicturesController < ApplicationController
  # before_action :set_upload, only: %i[ show edit update destroy ]

  # GET /pictures or /pictures.json
  def index
    @pic_count = Picture.count
    pic_all = Picture.all
    # @pictures = Picture.all
    @pictures = Picture.where("id < ?", 10)

    @atta_count = ActiveStorage::Attachment.count
    @atta_show = ActiveStorage::Attachment.all


    # User.joins(:posts, :account)

    @sas = ActiveStorage::Attachment.select `&:picture`

    @zwei = ActiveStorage::Attachment.joins(pictures: [:path])

    @users = User.all
  end
end


# active_employees = Employee.where(status: "active")
# active_employees.select do |employee|
#   employee.company.verified?
# end
