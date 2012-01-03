class AddPostCodeToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :post_code, :string
  end
end
