class RemoveUserIdFromChatrooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :chatrooms, :user_id
  end
end
