class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :from
      t.references :to
      t.string :status
      t.timestamps
    end
    add_index :requests, [:from_id, :to_id], unique: true
  end
end
