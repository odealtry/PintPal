class AddUpdatedToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :updated, :boolean, default: false
  end
end
