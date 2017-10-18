class AddIndexInUsersOnUserUuid < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :user_uuid
  end
end
