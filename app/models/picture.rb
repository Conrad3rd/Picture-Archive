class Picture < ApplicationRecord
  has_one :user
  belongs_to :user
  belongs_to :hashtag

  #has_many :pictures


end
