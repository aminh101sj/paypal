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
    @json = '{"group_id": 1, "email": test@test.com}'
  end

  def getAllOrders   
    @group_id = params[:group_id]
    email = params[:email]
    leader = User.where(:email => email).first 
    users = User.where(:groups_id => @group_id)
    response = {};

=begin
    users.each do |u|
      orders = Orders.where(:groups_id => @group_id, :users_id => u.id)
      next if (orders.nil? || orders.empty?);
      response[u.email] = orders;
    end 
=end
    
    total_price = 0
    others_price = 0
    leaders_price = 0
    unless leader.nil? || leader.groups_id.to_s != @group_id.to_s 
      users.each do |u|
        orders = Orders.where(:groups_id => @group_id, :users_id => u.id)
        orders.each do |o|
          if u.id.to_s == leader.id.to_s
            leaders_price += o.price
          else
            others_price += o.price
          end 
          total_price += o.price
        end
      end 
    end

    ordersA = Orders.where(:groups_id => @group_id)
    response["orders"] = ordersA
    response["my_price"] = leaders_price
    response["others_price"] = others_price
    response["total_price"] = total_price
    render :json => response;

  end

  def test_successfulPayments
    @json = '{"email": "test@test.com", "group_id": 1}'  
  end

  def successfulPayments
    @group_id = params[:group_id]
    @email = params[email]
    leader = User.where(:email => @email).first 
    orders = Orders.where(:groups_id => @group_id)
    orders.each do |o|
      user = User.where(:id => o.users_id).first
      order = Orders.where(:id => o.id).first
      order.completed = true
      order.save 
      unless leader.id == user.id 
        UserMailer.payment_reminder(user.email, o.price, @email).deliver
      end
    end

    response = {}
    response["success"] = 1
    render :json => reponse    
  end

  def payback

  end

end
