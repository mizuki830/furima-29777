class ShoppingOrder

  include ActiveModel::Model
  attr_accessor :post_number, :current_place_id, :city, :street_number, :build_name, :phone_number, :token, :item_id, :user_id
  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :current_place_id, numericality: { other_than: 1 }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A\d{1,11}\z/ }
    validates :token
  end

  def save
    #購入情報のデータの保存
    shopping = Shopping.create(user_id: user_id, item_id: item_id)
    #配送先住所のデータの保存
    ShoppingAddress.create(post_number: post_number, current_place_id: current_place_id, city: city, street_number: street_number, build_name: build_name, phone_number: phone_number, shopping_id: shopping.id)
    #カード情報は保存しない
  end
end