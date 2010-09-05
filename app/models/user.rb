class User < ActiveRecord::Base 
  has_many :purchases
  has_many :user_preferences
  
  acts_as_authentic
  
  
end
