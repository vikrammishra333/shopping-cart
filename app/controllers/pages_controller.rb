class PagesController < ApplicationController
  
  before_filter :find_or_create_cart, :only => [:checkout, :add_to_cart, :show_cart, :remove_from_cart, :empty_cart, :save_order]
  
 def home
	@title = "Home"
  end

  def contact
	@title = "Contact"
  end

  def about
	@title = "About Us"
  end

  def help
	@title = "Help"
  end
  
 
  def add_to_cart
	product = Product.find(params[:id])
    (session[:cart_items] ||= []) << product.id
	@cart.add_item(product)
	product.available_item -= 1 
	product.update_attributes(params[:product])
	flash[:notice] = "One item is added to your cart."
	redirect_back_or root_path
  end 
  
  def show_cart
	@order = Order.new
	if @order.save
		@order.line_items << @cart.items
	else
		flash[:notice] = "Could not save order"
	end
  end
  
  def empty_cart
	session[:cart_items].each do |id|
		product = Product.find(id)
		product.available_item += 1 
		product.update_attributes(params[:product])	
	end
	session[:cart_items] = []
	@cart.empty_all_items
	flash[:notice] = "Your Cart is empty now."
	redirect_back_or root_path
  end
  
  def remove_from_cart
	product = Product.find(params[:id])
	product.available_item += 1 
	product.update_attributes(params[:product])
	@cart.remove_product(product)
	flash[:notice] = "One item was removed from your cart"
	redirect_to show_cart_path
  end
  
  def checkout
	@customer = Customer.new
  end
  
  def save_order
	@order = Order.new
	if @order.save
		@order.line_items << @cart.items
		@order.paypal_url('http://192.168.11.235:3000')
	else
		flash[:notice] = "Could not save order"
	end
  end
  
  
  private
  
  def find_or_create_cart
	@cart = session[:cart] ||= Cart.new
  end
  
end
