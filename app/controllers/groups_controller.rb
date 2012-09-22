class GroupsController < ApplicationController
  
  def test
    arr = ["minh@gmail.com", "two@gmail.com", "three@gmail.com"]
    var = "\"test@test.com\", \"test2@test.com\""
    @json = '{"emails": [' + var + '], "leader": "leader@lead.com"}'
  end


  def createGroup
    @content = JSON.parse(params[:info])
    @group_info = ActiveSupport::JSON.decode(params[:info])   
  
    group = Groups.new
    group.save

    @group_info["emails"].each do |email|
        user = User.where(:email => email).first
        group.users << user
        user.save        
    end 

    user = User.where(:email => @group_info["leader"]).first
    group.users << user
    user.save
    group.name = user.email
    group.save 
    @json = "{\"group_id\": " + group.id.to_s + " }".to_json
   end

  def test_getGroup
   @json = '{"my_email": "test@test.com"}'
  end

  def getGroup
    @my_email = ActiveSupport::JSON.decode(params[:info])
    user = User.where(:email => @my_email["my_email"]).first
    @group_id = user.groups_id
    @json = "{\"group_id\": " + @group_id.to_s + " }".to_json
  end
end
