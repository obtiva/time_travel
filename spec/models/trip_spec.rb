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
end
