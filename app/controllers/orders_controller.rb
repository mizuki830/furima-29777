class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @shopping = ShoppingOrder.new(shopping_params)
    if @shopping.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def shopping_params
    params.permit(:post_number, :current_place_id, :city, :street_number, :build_name, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_c6c0e88c15f4df5e18833e9b"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: shopping_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
