class Booking < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: :user_id
  belongs_to :seat
  belongs_to :match
  has_one :seller, through: :seat, source: :user

end
