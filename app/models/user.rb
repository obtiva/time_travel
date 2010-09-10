class User < ActiveRecord::Base 
  has_many :purchases
  has_many :user_preferences
  has_many :friend_requests, :class_name => "Friend", :foreign_key => :request_sender_id
  has_many :friend_requests_received, :class_name => "Friend", :foreign_key => :request_receiver_id
  
  acts_as_authentic
  
  def friends
    friends = []
    friend_requests.each do |friend|
      friends << friend.receiver
    end
    friend_requests_received.each do |friend|
      friends << friend.sender
    end
    friends
  end
  
  def unpurchased_trips
    return Trip.all if purchases.empty?
    Trip.all(:conditions => ["id NOT IN (?)", purchases.map(&:trip_id)])
  end
  
  
end
