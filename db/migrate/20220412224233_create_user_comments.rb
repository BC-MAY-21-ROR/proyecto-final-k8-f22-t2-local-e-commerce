class CreateUserComments < ActiveRecord::Migration[7.0]
  def change
    create_table :user_comments do |t|
      t.string :comment
      t.integer :ranking

      t.timestamps
    end
  end
end
