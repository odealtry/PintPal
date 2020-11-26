class AddReferenceToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :booking, foreign_key: true, null: false
  end
end
