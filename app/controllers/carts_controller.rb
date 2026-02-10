class CartsController < ApplicationController
  def show
    @cart=current_user.orders.find_by(status: "cart")
  end
end
