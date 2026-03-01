class OrdersController < ApplicationController

  def show
    @cart=current_user.orders.find_by(status: "cart")
  end

  def checkout
    @cart=current_user.orders.find_by(status: "cart")
    @cart.update(status: "placed")
    respond_to do |format|
      format.html { redirect_to products_path, notice: "Order placed!" }
    end
  end

end
