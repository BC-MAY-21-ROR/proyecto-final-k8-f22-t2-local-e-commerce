class UpdateForeignKeyOnOrderDetails < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :order_details, :posts
    add_foreign_key :order_details, :posts, on_delete: :cascade
  end
end
