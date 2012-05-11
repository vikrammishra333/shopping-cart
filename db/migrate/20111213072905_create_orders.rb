class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :id
      t.string :invoice_number

      t.timestamps
    end
  end
end
