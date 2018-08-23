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

  # seller journey
  has_many :seats
end
