class Entry < ActiveRecord::Base
  validates :user_uuid, presence: true
end
