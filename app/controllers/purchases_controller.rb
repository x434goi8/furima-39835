class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchaseshipping = PurchaseShipping.new
  end
  
  def create
    @purchaseshipping = PurchaseShipping.new(purchase_params) 

    if @purchaseshipping.valid? 
      @purchaseshipping.save 
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private
  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :city_or_district, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end





