class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :price
      t.boolean :sold, default: false
      t.references :seat, foreign_key: true
      t.references :match, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
