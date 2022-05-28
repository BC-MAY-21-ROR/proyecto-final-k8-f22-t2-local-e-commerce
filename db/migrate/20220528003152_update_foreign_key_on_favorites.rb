class UpdateForeignKeyOnFavorites < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :favorites, :posts
    remove_foreign_key :favorites, :users
    add_foreign_key :favorites, :posts, on_delete: :cascade
    add_foreign_key :favorites, :users, on_delete: :cascade
  end
end
