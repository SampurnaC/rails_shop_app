class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product

  def create
    current_user.favorites.find_or_create_by(product: @product)
    redirect_to root_path
  end

  def destroy
    favorite=current_user.favorites.find_by(product: @product)
    favorite.destroy
    redirect_to root_path
  end

  private
  
  def set_product
    @product=Product.find(params[:product_id])
  end
end
