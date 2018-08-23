class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.date :date
      t.string :home_team
      t.string :away_team
      t.string :photo
      t.timestamps
    end
  end
end
