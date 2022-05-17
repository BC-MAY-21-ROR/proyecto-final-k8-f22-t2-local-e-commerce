class RemovePictureColumnFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :picture
  end
end
