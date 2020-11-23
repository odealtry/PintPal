class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.integer :outdoor_rating
      t.integer :heat_rating
      t.integer :pricing_rating

      t.timestamps
    end
  end
end
