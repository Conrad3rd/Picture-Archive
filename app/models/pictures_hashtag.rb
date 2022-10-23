class PicturesHashtag < ApplicationRecord
  belongs_to :hashtag
  belongs_to :picture
  # belongs_to :user

end
