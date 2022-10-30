class PicturesHashtag < ApplicationRecord
  has_many :pictures
  has_many :hashtags

  belongs_to :hashtag
  #belongs_to :picture
  # belongs_to :user

end
