Given /^a set of trips$/ do
  Trip.create!(
      :name => "Mayflower Luxury Cruise",
      :tag_line => "Enjoy The Cruise That Started It All",
      :start_date => "May 17, 1620", 
      :end_date => "November 21, 1620", 
      :location => "Atlantic Ocean",
      :activity => "Cruising",
      :image_name => "mayflower.jpg",
      :price => 1204)

  Trip.create!(
      :name => "See Shakespeare's Plays",
      :tag_line => "See The Master As Intended",
      :start_date => "November 1, 1604", 
      :end_date => "October 31, 1605",
      :location => "England",
      :activity => "Theater",
      :image_name => "shakespeare.jpg",
      :price => 1313)
end

Given /^a logged in user$/ do
  @user = User.create!(
      :persistence_token => "persistence token",
      :first_name => "Fred",
      :last_name => "Flintstone",
      :login => "fred",
      :password_salt => "salt",
      :password => "password",
      :password_confirmation => "password",
      :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("password" + "salt"),
      :email => "fred@test.com")
  visit("/")
  click_link("Log In")
  fill_in("Login", :with => "fred")
  fill_in("Password", :with => "password")
  click_button("Login")
end

When /^the user buys a trip$/ do
  click_link("Go on Mayflower Luxury Cruise")
end

When /^goes back to the home page$/ do
  visit("/")
end

Then /^the user should not see the trip$/ do
  response.should_not contain("Mayflower Luxury Cruise")
end
