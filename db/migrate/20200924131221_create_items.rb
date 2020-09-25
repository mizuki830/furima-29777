class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :explain, null: false
      t.integer :price, null: false
      t.integer :category, null: false
      t.integer :condition, null: false
      t.integer :shopping_change, null: false
      t.integer :current_place, null: false
      t.integer :send_day, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end