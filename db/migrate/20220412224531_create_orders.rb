class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :total
      t.belongs_to :user

      t.timestamps
    end
  end
end
