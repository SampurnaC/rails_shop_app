class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    cart=current_user.orders.find_or_create_by(status: "cart")
    @product=Product.find(params[:product_id])
    @order_item=cart.order_items.find_by(product: @product)

    if @order_item
      @order_item.quantity+=1
      @order_item.save
    else
      @order_item=cart.order_items.build(product: @product, quantity: 1, price: @product.price)
      @order_item.save
    end

    redirect_to cart_path, notice: "Added to cart"
  end
  
  
end
