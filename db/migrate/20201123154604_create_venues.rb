class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :name
      t.integer :capacity
      t.integer :phone_number
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
