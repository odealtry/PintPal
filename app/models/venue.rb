class Venue < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :address, :name, presence: true
  validates :category, inclusion: { in: %w[Pub Bar Restaurant Club] }
end
