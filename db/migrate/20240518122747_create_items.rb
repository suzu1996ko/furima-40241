class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string     :name,               null: false
      t.text       :item_details,       null: false
      t.integer    :category_id,        null: false
      t.integer    :state_id,           null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true
      t.integer    :postage_id,         null: false
      t.integer    :prefecture_id,      null: false
      t.integer    :shipping_date_id,   null: false


    end
  end
end
