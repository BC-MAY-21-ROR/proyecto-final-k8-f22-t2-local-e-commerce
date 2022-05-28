class UpdateForeignKeyOnPostComments < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :post_comments, :posts
    add_foreign_key :post_comments, :posts, on_delete: :cascade
  end
end
