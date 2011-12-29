class AddParentIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :parent_id, :integer, :default => 0
  end
end
