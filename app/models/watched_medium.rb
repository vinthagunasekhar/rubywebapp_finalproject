class WatchedMedium < ApplicationRecord
  belongs_to :user
  belongs_to :medium
  belongs_to :episode, optional: true
end
