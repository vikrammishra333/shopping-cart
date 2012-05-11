class Product < ActiveRecord::Base
	belongs_to :category
	attr_accessible :name, :category_id, :pic, :price, :description, :available_item
  has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "80x80>" }

  validates_attachment :pic, :presence => true,
  :size => { :in => 0..1.megabytes }

end
