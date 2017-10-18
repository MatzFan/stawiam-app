class User < ActiveRecord::Base
  has_many :entries

  validates :user_uuid, presence: true
end
