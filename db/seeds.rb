Trip.delete_all

Trip.create!(
    :name => "Mayflower Luxury Cruise",
    :tag_line => "Enjoy The Cruise That Started It All",
    :start_date => "May 17, 1620", 
    :end_date => "November 21, 1620", 
    :price => 1204)
Trip.create!(
    :name => "See Shakespeare's Plays",
    :tag_line => "See The Master As Intended",
    :start_date => "November 1, 1604", 
    :end_date => "October 31, 1605",
    :price => 1313)
Trip.create!(
    :name => "Mission To Mars", 
    :tag_line => "Take One Huge Step For Man",
    :start_date => "July 16, 2047", 
    :end_date => "July 24, 2049",
    :price => 2093)
Trip.create!(:name => "The Cubs Win The World Series",
    :tag_line => "Experience The Ultimate Rarity",
    :start_date => "October 10, 1908", 
    :end_date => "October 14, 1908", 
    :price => 10343)
    
Trip.create!(:name => "Hike With Lewis And Clark",
    :tag_line => "Enjoy the Great Outdoors",
    :start_date => "May 14, 1804", 
    :end_date => "September 23, 1806", 
    :price => 10343)
    
User.delete_all

User.create!(
    :persistence_token => "persistence token",
    :first_name => "Fred",
    :last_name => "Flintstone",
    :login => "test",
    :password_salt => "salt",
    :password => "password",
    :password_confirmation => "password",
    :crypted_password => Authlogic::CryptoProviders::Sha512.encrypt("password" + "salt"),
    :email => "test@test.com")
    