class Shopping < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :order
  has_one :shopping_address
end
