class Venue < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :address, :name, presence: true
  validates :category, inclusion: { in: %w[Pub Bar Restaurant Club] }
end
