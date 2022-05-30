class AddStatusAndUserIdToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :status, :boolean, default: true
    add_reference :carts, :user, index: true
    add_foreign_key :carts, :users
  end
end
