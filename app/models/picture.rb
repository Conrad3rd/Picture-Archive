class Picture < ApplicationRecord
  has_one :user
  has_many :hashtags
  has_many :pictures_hashtags
  has_many :pictures, through: :user

  belongs_to :user
  # belongs_to :hashtag
  # belongs_to :pictures_hashtag
end
