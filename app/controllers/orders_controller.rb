class OrdersController < ApplicationController


  def test_submitOrder
    var = '[{"name": "Salmon", "price": 500}, {"name": "Pasta", "price": 1000}, {"name": "Steak", "price": 700}]'    
    var2 = "{ \"group_id\": 1, \"email\": \"test@test.com\", \"orders\": " + var + " }"
    @json = var2 
  #  var = '[{"Salmon": 500, "Pasta": 1000, "Steak": 700}]'    
  #  var2 = "{ \"group_id\": 1, \"u_id\": 2, \"orders\": " + var + " }"
  #  @json = var2 
  end

  def submitOrder
   @group_id = params[:group_id]
   @email = params[:email]
   @orders = ActiveSupport::JSON.decode(params[:order])

    #@orders = ActiveSupport::JSON.decode(params[:info])  
    #@email = @orders["email"]
    #@group_id = @orders["group_id"]
    
    user = User.where(:email => @email).first
    
    @orders.each do |order| 
      o = Orders.new     
      o.users_id = user.id
      o.groups_id = @group_id
      o.item_name = order["name"]
      o.price = order["price"]
      o.save
    end
   
    @success = "{\"success\": 1}"
  end

  def test_getAllOrders
    @json = '{"group_id": 1}'
  end

  def getAllOrders
    @group = ActiveSupport::JSON.decode(params[:info])
    @group_id = @group["group_id"] 
    orders = Orders.where(:groups_id => @group_id)
    @list = '['
    orders.each do |o|
      u = User.where(:id => o.users_id).first
      @list += '{"email": "' + u.email + '", "item_name": "' + o.item_name + '", "price": '+ o.price.to_s + ' },'
    end  
    @list = @list[0..-2] 
    @list += ']'
    
  end

  def test_successfulPayments
    @json = '{"group_id": 1}'  
  end

  def successfulPayments
    @group = ActiveSupport::JSON.decode(params[:info])
    @group_id = @group["group_id"]
    orders = Orders.where(:groups_id => @group_id)
    orders.each do |o|
      user = User.where(:id => o.users_id).first
      order = Orders.where(:id => o.id).first
      order.completed = true
      order.save  
      UserMailer.payment_reminder("aminh101sj@gmail.com", o.price).deliver
    end
    
  end

end
