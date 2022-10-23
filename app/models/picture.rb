class Picture < ApplicationRecord
  has_one :user
  belongs_to :user
  #has_many :pictures


end
