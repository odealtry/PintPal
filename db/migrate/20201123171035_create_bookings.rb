class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.datetime :start
      t.integer :length
      t.integer :party_size
      t.boolean :confirmed

      t.timestamps
    end
  end
end
