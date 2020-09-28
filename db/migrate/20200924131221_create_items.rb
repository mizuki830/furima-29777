class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :explain, null: false
      t.integer :price, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shopping_change_id, null: false
      t.integer :current_place_id, null: false
      t.integer :send_day_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
      # アクティブハッシュに対して_id
    end
  end
end