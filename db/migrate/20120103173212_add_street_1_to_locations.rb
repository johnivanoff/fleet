class AddStreet1ToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :quantity, :string
  end
end
