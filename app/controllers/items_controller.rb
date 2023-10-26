class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit]
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    @items = Item.order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    if current_user == @item.user
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    if current_user != @item.user
      redirect_to root_path
    end

    if @item.purchase != nil
      redirect_to root_path
    end
  end

  def update
    if current_user == @item.user
      if @item.update(item_params)
        redirect_to item_path(@item)
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to root_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :condition_id,
                                 :shipping_fee_responsibility_id, :prefecture_id, :shipping_duration_id, :price, :image).merge(user_id: current_user.id)
  end
end
