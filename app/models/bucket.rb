class Bucket < ApplicationRecord
  has_many :trips
  has_many :cities, through: :trips
end
