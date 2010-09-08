class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  
  after_create :boom
  
  def boom
    p "That'll be $10, please."
  end
  
end
