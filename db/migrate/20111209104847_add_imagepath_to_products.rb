class AddImagepathToProducts < ActiveRecord::Migration
  def change
    add_column :products, :imagepath, :string
  end
end
