class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shopping_change
  belongs_to_active_hash :current_place
  belongs_to_active_hash :send_day

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :explain, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :shopping_change_id, numericality: { other_than: 1 }
    validates :current_place_id, numericality: { other_than: 1 }
    validates :send_day_id, numericality: { other_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: {in: 300..9999999}
    # viewとmodelのところでアクティブハッシュに対して_id
  end
end
