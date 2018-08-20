class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :seats
         has_many :bookings
         validates_presence_of(:first_name, :last_name)


  # buyer journey
  has_many :bookings
  has_many :bought_tickets, through: :bookings, source: :match_ticket

  # seller journey
  has_many :seats
  has_many :selling_tickets, through: :seats, source: :match_ticket
end
