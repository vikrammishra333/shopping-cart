class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category_id
      t.decimal :price, :precision => 10, :scale => 2, :default => 0.0
      t.text :description

      t.timestamps
    end
  end
end
