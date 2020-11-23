class Review < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  validates :outdoor_rating, :heat_rating, :pricing_rating, presence: true
  validates :outdoor_rating, :heat_rating, :pricing_rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
