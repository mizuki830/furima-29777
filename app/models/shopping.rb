class Shopping < ApplicationRecord
  has_one :order
  has_one :shopping_address
end
