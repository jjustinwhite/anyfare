class Trip < ApplicationRecord
  belongs_to :city
  belongs_to :bucket
end
