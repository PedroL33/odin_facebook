class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :users, foreign_key: true
      t.string :content
      t.timestamps
    end
  end
end
