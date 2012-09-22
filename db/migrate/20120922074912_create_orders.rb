class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :group_id
      t.integer :user_id
      t.string :item_name
      t.integer :price

      t.timestamps
    end
  end
end
