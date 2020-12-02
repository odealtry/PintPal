class ChangeOutdoorRatingToOverallRating < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :outdoor_rating, :overall_rating
  end
end
