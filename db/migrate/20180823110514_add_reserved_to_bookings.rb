class AddReservedToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :reserved, :boolean, default: false
  end
end
