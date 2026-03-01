class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, except: [:index]

  def index
    @products=current_user.favorite_products
  end

  def create
    current_user.favorites.find_or_create_by(product: @product)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

  def destroy
    favorite=current_user.favorites.find_by(product: @product)
    favorite&.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

  private
  
  def set_product
    @product=Product.find(params[:product_id])
  end
end
