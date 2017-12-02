class Entry < ActiveRecord::Base
  belongs_to :user, counter_cache: true

  scope :latest, -> { includes(:user).order(created_at: :desc) }
end
