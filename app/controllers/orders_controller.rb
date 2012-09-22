class OrdersController < ApplicationController


  def test_submitOrder
    var = '[{"name": "Salmon", "price": 500}, {"name": "Pasta", "price": 1000}, {"name": "Steak", "price": 700}]'    
    var2 = "{ \"group_id\": 1, \"u_id\": 2, \"orders\": " + var + " }"
    @json = var2 
  #  var = '[{"Salmon": 500, "Pasta": 1000, "Steak": 700}]'    
  #  var2 = "{ \"group_id\": 1, \"u_id\": 2, \"orders\": " + var + " }"
  #  @json = var2 
  end

  def submitOrder
    @orders = ActiveSupport::JSON.decode(params[:info])  
    @u_id = @orders["u_id"]
    @group_id = @orders["group_id"]

    @orders["orders"].each do |order| 
      o = Orders.new     
      o.users_id = @u_id
      o.groups_id = @group_id
      o.item_name = order["name"]
      o.price = order["price"]
      o.save
    end
  
    @success = "{\"success\": 1}"
  end

end
