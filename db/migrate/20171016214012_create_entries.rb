class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :user_uuid, null: false
      t.string :full_name
      t.string :avatar_url
      t.timestamps null: false
    end
  end
end
