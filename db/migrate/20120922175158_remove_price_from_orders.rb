class RemovePriceFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :price
      end

  def down
    add_column :orders, :price, :integer
  end
end
