class AddColumnToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :photo, :string
  end
end
