class AddGroupsIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :groups_id, :integer

  end
end
