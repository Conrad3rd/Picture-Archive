class PicturesHashtag < ApplicationRecord
  has_many :pictures
  has_many :hashtags

  belongs_to :hashtag
  #belongs_to :picture
  # belongs_to :user

  # validates :hashtag_id, :picture_id, uniqueness: true
  validates :hashtag_id, uniqueness: { scope: :picture_id }


end
