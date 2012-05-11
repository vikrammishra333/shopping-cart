class Order < ActiveRecord::Base
	has_many :line_items
	belongs_to :customer
	
	def paypal_url(return_url)
		values = {
			:business => 'seller_1323953300_biz@mindfiresolutions.com',
			:cmd => '_cart',
			:upload => 1,
			:return => return_url,
			:invoice => id
		}
		line_items.each_with_index do |item, index|
		values.merge!({
			"amount_#{index+1}" => item.price,
			"item_name_#{index+1}" => item.product.name,
			"item_number_#{index+1}" => item.product_id,
			"quantity_#{index+1}" => item.quantity
		})
		end
		
		"https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
	end
end
