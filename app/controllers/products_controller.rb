class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to root_path
    else
      # エラーがある場合
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_description, :category_id, :condition_id, :shipping_fee_responsibility_id, :prefecture_id, :shipping_duration_id, :price, :image).merge(user_id: current_user.id)
  end
end