class User < ApplicationRecord
  has_many :media, class_name: 'Medium'
  has_one :profile
  has_many :watched_media, class_name: 'WatchedMedium'
  has_many :watched_episodes, through: :watched_media, source: :episode
  has_secure_password
end
