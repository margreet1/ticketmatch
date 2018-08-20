class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :match_ticket, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
