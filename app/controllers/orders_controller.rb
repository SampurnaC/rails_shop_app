class OrdersController < ApplicationController

  def show
    @cart=current_user.orders.find_by(status: "cart")
  end

  def checkout
    @cart=current_user.orders.find_by(status: "cart")
    @cart.update(status: "placed")    
  end

end
