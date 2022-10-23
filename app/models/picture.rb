class Picture < ApplicationRecord
  #belongs_to :user
  has_one :user
  #has_many :pictures

  # belongs_to :upload
  # has_many_attached :pictures

  # aa = ActiveStorage::Attachment
  # belongs_to :aa
end
