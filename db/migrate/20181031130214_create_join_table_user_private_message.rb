class CreateJoinTableUserPrivateMessage < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :private_messages do |t|
      # t.index [:user_id, :private_message_id]
      # t.index [:private_message_id, :user_id]
    end
  end
end
