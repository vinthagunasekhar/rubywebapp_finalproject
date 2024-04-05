class Episode < ApplicationRecord
  belongs_to :medium
  has_many :watched_media, class_name: 'WatchedMedium'
  has_many :watchers, through: :watched_media, source: :user
end
