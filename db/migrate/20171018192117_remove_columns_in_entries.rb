class RemoveColumnsInEntries < ActiveRecord::Migration[5.1]
  def change
    remove_column :entries, :user_uuid, :string, null: false
    remove_column :entries, :avatar_url, :string
    remove_column :entries, :full_name, :string
  end
end
