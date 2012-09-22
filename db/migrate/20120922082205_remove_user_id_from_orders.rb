class RemoveUserIdFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :user_id
        remove_column :orders, :group_id
      end

  def down
    add_column :orders, :group_id, :integer
    add_column :orders, :user_id, :integer
  end
end
