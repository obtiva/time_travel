require 'spec_helper'

describe Trip do
  
  describe "trip preference" do
    
    let (:user) do 
      User.create!(:login => "user", :email => "test@test.com",
          :password => "password", :password_confirmation => "password") 
    end
    
    let (:trip) do
      Trip.new(:name => "See Shakespeare's Plays", 
          :tag_line => "See The Master As Intended", :start_date => "November 1, 1604", 
          :end_date => "October 31, 1605", :location => "England", :activity => "Theater",
          :image_name => "shakespeare.jpg", :price => 1313)
    end
    
    it "has a preference value for a USA match" do
      user.user_preferences.create(:kind => "area", :name => "USA")
      trip.location = "USA"
      trip.preference_points(user).should == 7
    end
    
    it "has a preference value for a California match" do
      user.user_preferences.create(:kind => "area", :name => "USA")
      trip.location = "California"
      trip.preference_points(user).should == 7
    end
    
  end
  
  describe "preference points for friends" do
    before(:each) do
      @trip_1 = Trip.create!(:name => "Trip1")
      @trip_2 = Trip.create!(:name => "Trip2")
      @me = User.create!(:login => "me_me_me", :email => "me@test.com",
          :password => "password", :password_confirmation => "password")
      @you = User.create!(:login => "you", :email => "you@test.com",
          :password => "password", :password_confirmation => "password")
      Friend.create!(:sender => @me, :receiver => @you)
      @trip_1.stub!(:purchases).and_return([stub(:user => @you)])
    end
    
    it "should give points for friend" do
      @trip_1.friend_preference_points(@me).should == 10
    end
  end

end
