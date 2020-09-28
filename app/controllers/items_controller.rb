class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    unless user_signed_in?
      redirect_to user_session_path
    end
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :condition_id, :shopping_change_id, :current_place_id, :send_day_id, :price).merge(user_id: current_user.id)
  end
end
