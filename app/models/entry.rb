class Entry < ActiveRecord::Base
  validates :full_name, :user_uuid, presence: true
end
