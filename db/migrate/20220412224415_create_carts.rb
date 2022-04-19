class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :price
      t.references :post, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
