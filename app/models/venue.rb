class Venue < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :address, :name, presence: true
  validates :category, inclusion: { in: %w[Pub Bar Restaurant Club] }
  has_many_attached :photos
end
