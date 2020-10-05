class CreateShoppingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_addresses do |t|
      t.string :post_number, null: false
      t.integer :current_place_id, nill: false
      t.string :city, null: false
      t.string :street_number, null: false
      t.string :build_name
      t.string :phone_number, null: false
      t.references :shopping, null: false, foreign_key: true
      t.timestamps
    end
  end
end 