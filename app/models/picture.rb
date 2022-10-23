class Picture < ApplicationRecord
  belongs_to :user
  # has_many_attached :pictures

  # aa = ActiveStorage::Attachment
  # belongs_to :aa
end
