class DelelteRememberColumnToUserDevise < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :remember_created_atd_at
  end
end
