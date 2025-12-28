class ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_product, only: %i[show edit update destroy]
  def index
    @products=Product.all
  end

  def show
  end
  def new
    @product=current_user.products.build
  end

  def create
    @product=current_user.products.build(product_params)
    if @product.save
      redirect_to @product, notice: "Product submitted for review"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product successfully updated"
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
    binding.pry
    @product=Product.find(params[:id])
  end
  def product_params
    params.require(:title, :description, :price, :status)
  end

end
