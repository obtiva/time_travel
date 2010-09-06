Trip.delete_all

mayflower = Trip.create!(
    :name => "Mayflower Luxury Cruise",
    :tag_line => "Enjoy The Cruise That Started It All",
    :start_date => "May 17, 1620", 
    :end_date => "November 21, 1620", 
    :location => "Atlantic Ocean",
    :activity => "Cruising",
    :image_name => "mayflower.jpg",
    :price => 1204)

shakespeare = Trip.create!(
    :name => "See Shakespeare's Plays",
    :tag_line => "See The Master As Intended",
    :start_date => "November 1, 1604", 
    :end_date => "October 31, 1605",
    :location => "England",
    :activity => "Theater",
    :image_name => "shakespeare.jpg",
    :price => 1313)
    
mars = Trip.create!(
    :name => "Mission To Mars", 
    :tag_line => "Take One Huge Step For Man",
    :start_date => "July 16, 2047", 
    :end_date => "July 24, 2049",
    :location => "Outer Space",
    :activity => "Space Travel",
    :image_name => "mars.jpg",
    :price => 2093)
    
cubbies = Trip.create!(:name => "The Cubs Win The World Series",
    :tag_line => "Experience The Ultimate Rarity",
    :start_date => "October 10, 1908", 
    :end_date => "October 14, 1908",
    :location => "USA",
    :activity => "Baseball", 
    :image_name => "cubbies.jpg",
    :price => 10343)
    
lewis = Trip.create!(:name => "Hike With Lewis And Clark",
    :tag_line => "Enjoy the Great Outdoors",
    :start_date => "May 14, 1804", 
    :end_date => "September 23, 1806", 
    :location => "USA",
    :activity => "Hiking",
    :image_name => "lewis.jpg",
    :price => 10343)
    
lewis = Trip.create!(:name => "Visit Xerox PARC",
    :tag_line => "See the Lab That Started It All",
    :start_date => "December 12, 1979", 
    :end_date => "December 13, 1979", 
    :location => "USA",
    :activity => "Geeking Out",
    :image_name => "parc.jpg",
    :price => 10343)
    
User.delete_all

fred = User.create!(
    :persistence_token => "persistence token",
    :first_name => "Fred",
    :last_name => "Flintstone",
    :login => "fred",
    :password_salt => "salt",
    :password => "password",
    :password_confirmation => "password",
    :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("password" + "salt"),
    :email => "fred@test.com")
    
fred.user_preferences.create(:kind => "century", :name => "1600s")

wilma = User.create!(
    :persistence_token => "persistence token",
    :first_name => "Wilma",
    :last_name => "Flintstone",
    :login => "wilma",
    :password_salt => "salt",
    :password => "password",
    :password_confirmation => "password",
    :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("password" + "salt"),
    :email => "wilma@test.com")
    
barney = User.create!(
    :persistence_token => "persistence token",
    :first_name => "Barney",
    :last_name => "Rubble",
    :login => "barney",
    :password_salt => "salt",
    :password => "password",
    :password_confirmation => "password",
    :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("password" + "salt"),
    :email => "barney@test.com")
        
betty = User.create!(
    :persistence_token => "persistence token",
    :first_name => "Betty",
    :last_name => "Rubble",
    :login => "betty",
    :password_salt => "salt",
    :password => "password",
    :password_confirmation => "password",
    :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("password" + "salt"),
    :email => "betty@test.com")
    
Friend.delete_all    
    
Friend.create(:sender => fred, :receiver => barney)
Friend.create(:sender => wilma, :receiver => betty)
    