class Trip < ActiveRecord::Base
  
  has_many :purchases
  has_many :trip_features
  
  def preference_points(current_user)
    trip_points = 0

    current_user.user_preferences.each do |pref|
      if pref.kind == "century"
        if (start_date.to_s + "'s" == pref.name) 
          trip_points += 5
        end
        if (end_date.to_s + "'s" == pref.name)
          trip_points += 5
        end
      end
      if (pref.name == "Other" && location == "Outer Space")
        trip_points += 3
      end
      if pref.kind == "area"
        if (pref.name == location)
          trip_points += 7
        end
      end
      if (pref.name == "Europe" && location == "England")
        trip_points += 5
      end
      if (pref.name == "USA" && location == "California")
        trip_points += 7
      end
      if (pref.name == "Mountain Climbing" && activity == "Hiking")
        trip_points += 3
      end
      if (pref.name == "Europe" && location == "France")
        trip_points += 5
      end
      if (pref.name == "Asia" && location == "China")
        trip_points += 5
      end
      if (pref.name == "Concert Going" && activity == "Theater")
        trip_points += 3
      end
      if pref.kind == "activity"
        if (pref.name == activity)
          trip_points += 8
        end
      end
      if (pref.name == "Asia" && location == "Himalayas")
        trip_points += 5
      end
      if (pref.name == "Europe" && location == "UK")
        trip_points += 3
      end
      if (pref.name == "Other" && location == "Atlantic Ocean")
        trip_points += 5
      end
    end
    trip_points
  end
  
end
