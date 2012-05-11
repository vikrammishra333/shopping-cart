class AddAvailableItemToProduct < ActiveRecord::Migration
  def change
    add_column :products, :available_item, :integer
  end
end
