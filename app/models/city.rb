class City < ApplicationRecord
  has_many :trips
  has_many :buckets, through: :trips
end
