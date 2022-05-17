class DropTypesTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :types
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
