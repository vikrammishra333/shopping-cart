class Cart
	attr_reader :items,:total_price
	
	def initialize
		@items = []
		@total_price = 0.0
	end
	
	def add_item(product)
		existing_item = @items.find { |item| item.product.id == product.id}
		if existing_item
			existing_item.quantity += 1
		else
			@items << LineItem.new_based_on(product)
		end
		@total_price += product.price
	end
	
	def empty_all_items
		@items = []
		@total_price = 0.0
	end
	
	def remove_product(product)
		existing_item = @items.find { |item| item.product.id == product.id}
		if existing_item && existing_item.quantity > 1
			existing_item.quantity -= 1
		else
			@items.delete(existing_item)
		end
		@total_price -= product.price
	end
	
end
