class Medium < ApplicationRecord
  belongs_to :user
  has_many :episodes
  has_many :watched_media, class_name: 'WatchedMedium'
  enum ott: { amazon_prime: 'Amazon Prime', disney_plus: 'Disney Plus', netflix: 'Netflix', hulu: 'Hulu', youtube: 'Youtube' }
  has_many :watchers, through: :watched_media, source: :user
end
