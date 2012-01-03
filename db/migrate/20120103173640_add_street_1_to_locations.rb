class AddStreet1ToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :street_1, :string
  end
end
