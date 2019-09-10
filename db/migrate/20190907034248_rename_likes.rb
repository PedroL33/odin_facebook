class RenameLikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :posts_id
    remove_column :likes, :users_id
    add_reference :likes, :post, foreign_key: true
    add_reference :likes, :user, foreign_key: true
  end
end
