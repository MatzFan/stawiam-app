class User < ActiveRecord::Base
  has_many :entries, dependent: :destroy

  validates :user_uuid, presence: true

  scope :top5, -> { order(entries_count: :desc).limit(5) }
end
