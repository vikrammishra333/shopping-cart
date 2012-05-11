module ApplicationHelper
	def title
		base_title = "Shopping Cart"
		if @title.nil?
		  base_title
		else
		  "#{base_title} | #{@title}"
		end
	end
	
	def getAllCategory
		@categories = Category.all
	end
	
	def getAllProducts(category_id)
		@products = Product.where(:category_id => category_id)
	end
	
end

