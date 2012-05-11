class AddPicToProduct < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.has_attached_file :pic
    end
  end

  def self.down
    drop_attached_file :products, :pic
  end
end
