class Dashboard::ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_product, only: %i[show edit update destroy]
  def index
    @products=current_user.products.all
  end

  def show
  end
  def new
    @product=current_user.products.build
  end

  def create
    @product=current_user.products.build(product_params)
    if @product.save
      redirect_to dashboard_product_path(@product), notice: "Product submitted for review"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to dashboard_product_path(@product), notice: "Product successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path, notice: "Product successfully deleted"
    end
  end

  private
  
  def set_product
    @product=Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

end
