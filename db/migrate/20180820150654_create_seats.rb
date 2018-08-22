class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.string :number
      t.string :stadium
      t.string :description
      t.string :view
      t.string :team
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
