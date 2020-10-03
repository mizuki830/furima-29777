class ShoppingOrder

  include ActiveModel::Model
  attr_sccessor :post_number, :prefecture, :city, :street_number, :build_name, :phone_number

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A\d{1,11}\z/ }
  end

end