class ChangeNameToTypes < ActiveRecord::Migration[7.0]
  def change
   change_column :types, :name, 'boolean USING CAST(name AS boolean)'
  end
end
