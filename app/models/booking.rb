class Booking < ApplicationRecord
  before_save :default_values
  belongs_to :user
  belongs_to :venue
  validates :start, :party_size, presence: true
  def default_values
    self.confirmed = false if self.confirmed.nil?
  end
end