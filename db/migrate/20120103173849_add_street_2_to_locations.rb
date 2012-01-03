class AddStreet2ToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :street_2, :string
  end
end
