# app/models/profile.rb
class Profile < ApplicationRecord
  belongs_to :user
end
