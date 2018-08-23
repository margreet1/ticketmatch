class Seat < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  validates_presence_of(:number, :description, :team)
end
