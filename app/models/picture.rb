class Picture < ApplicationRecord
  has_one :user
  #has_many :hashtags
  has_many :pictures_hashtags

  belongs_to :user
  belongs_to :hashtag
  belongs_to :pictures_hashtag

  #has_many :pictures


end
