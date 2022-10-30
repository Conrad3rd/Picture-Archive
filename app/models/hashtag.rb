class Hashtag < ApplicationRecord
  has_many :pictures_hashtags
  # belongs_to :pictures_hashtag
end
