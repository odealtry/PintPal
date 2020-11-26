class DeleteColumnFromChatroom < ActiveRecord::Migration[6.0]
  def change
    remove_column :chatrooms, :venue_id
  end
end
