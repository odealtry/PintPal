class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  has_one :chatroom, dependent: :destroy
  validates :start, :party_size, presence: true
end
