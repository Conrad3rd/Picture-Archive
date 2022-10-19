class PicturesHashtag < ApplicationRecord
  belongs_to :hashtag
  belongs_to :picture
end
