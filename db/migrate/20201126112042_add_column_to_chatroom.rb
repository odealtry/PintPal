class AddColumnToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :bookings, foreign_key: true
  end
end
