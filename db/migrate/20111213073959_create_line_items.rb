class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :price,      :precision => 10, :scale => 2, :default => 0.0

      t.timestamps
    end
  end
end
