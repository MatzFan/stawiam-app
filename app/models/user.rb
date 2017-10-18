class User < ActiveRecord::Base
  has_many :entries, dependent: :destroy

  validates :user_uuid, presence: true
end
