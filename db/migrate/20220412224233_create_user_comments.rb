class CreateUserComments < ActiveRecord::Migration[7.0]
  def change
    create_table :user_comments do |t|
      t.text :comment
      t.integer :ranking
      t.string :title
      t.timestamps
    end
  end
end
