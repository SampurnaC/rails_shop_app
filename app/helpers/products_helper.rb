module ProductsHelper
  def favorited?(product)
    return false unless current_user && product
    user_favorites = current_user.favorites
    user_favorites.exists?(product_id: product.id)
  end
end
