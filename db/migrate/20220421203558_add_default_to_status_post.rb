class AddDefaultToStatusPost < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :status_id, 1
  end
end
