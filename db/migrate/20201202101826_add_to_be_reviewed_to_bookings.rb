class AddToBeReviewedToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :to_be_reviewed, :boolean, default: true
  end
end
