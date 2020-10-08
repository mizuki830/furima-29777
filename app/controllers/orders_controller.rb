class OrdersController < ApplicationController

  before_action :choice_item, only: [:index, :create]

  def index
    @shopping = ShoppingOrder.new
    if user_signed_in?
      if current_user.id == @item.user_id || @item.shopping != nil
        redirect_to root_path
      end
    else
      redirect_to user_session_path
    end
  end

  def create
    @shopping = ShoppingOrder.new(shopping_params)
    if @shopping.valid?
      @shopping.save
      pay_item
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

  def choice_item
    @item = Item.find(params[:item_id])
  end
end
