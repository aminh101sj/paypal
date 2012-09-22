class AddUsersIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :users_id, :integer

    add_column :orders, :groups_id, :integer

  end
end
