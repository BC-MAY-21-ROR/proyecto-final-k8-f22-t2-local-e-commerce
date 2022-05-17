class DropSchedulesTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :schedules
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
