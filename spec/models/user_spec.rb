require 'spec_helper'

describe User do
  
  describe "unpurchased trips" do
    
    before(:each) do |variable|
      @trip_1 = Trip.create!(:name => "Trip1")
      @trip_2 = Trip.create!(:name => "Trip2")
      @user = User.create!(:login => "user", :email => "test@test.com",
          :password => "password", :password_confirmation => "password")
    end
    
    
    it "returns all trips if no purchase" do
      @user.unpurchased_trips.map(&:name).should =~ ["Trip1", "Trip2"]
    end
    
    it "returns unpurchased trips if purchased" do
      Purchase.create!(:user => @user, :trip => @trip_1)
      @user.unpurchased_trips.map(&:name).should =~ ["Trip2"]
    end
    
    it "returns empty if all purchased" do
      Purchase.create!(:user => @user, :trip => @trip_1)
      Purchase.create!(:user => @user, :trip => @trip_2)
      @user.unpurchased_trips.should be_empty
    end
  end
  
  describe "friends on trip" do
    
    before(:each) do
      @trip_1 = Trip.create!(:name => "Trip1")
      @trip_2 = Trip.create!(:name => "Trip2")
      @me = User.create!(:login => "me_me_me", :email => "me@test.com",
          :password => "password", :password_confirmation => "password")
      @you = User.create!(:login => "you", :email => "you@test.com",
          :password => "password", :password_confirmation => "password")
      Friend.create!(:sender => @me, :receiver => @you)
    end
    
    it "returns empty if no friends" do
      @me.friends.should == [@you]
      @me.friends_on_trip(@trip_1).should be_empty
    end
    
    it "returns friend if a friend" do
      @trip_1.stub!(:purchases).and_return([stub(:user => @you)])
      @me.friends_on_trip(@trip_1).should == [@you]
    end
    
  end
  
end