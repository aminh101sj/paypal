class AddPriceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :price, :float, :default => 0.0

  end
end
