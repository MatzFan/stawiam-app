class AddReferenceToUsersInEntries < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :entries, :user, foreign_key: true, null: false
  end
end
