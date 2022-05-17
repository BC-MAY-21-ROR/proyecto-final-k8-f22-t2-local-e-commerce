class RemoveTypeColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :type_id
  end
end
