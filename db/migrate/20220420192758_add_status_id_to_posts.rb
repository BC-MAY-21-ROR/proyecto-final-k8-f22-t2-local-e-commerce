class AddStatusIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :status, null: false, foreign_key: true
  end
end
