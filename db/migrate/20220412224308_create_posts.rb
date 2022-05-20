class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :picture
      t.integer :price
      t.integer :stock
      t.timestamps
      t.belongs_to :user
    end
  end
end
