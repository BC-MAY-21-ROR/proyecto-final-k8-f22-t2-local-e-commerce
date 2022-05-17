class AddDeleveryToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :delivery, :int
  end
end
