class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :post, null: false, foreign_key: true
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
