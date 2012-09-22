class User < ActiveRecord::Base
  belongs_to :groups
end
