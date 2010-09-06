ActionController::Routing::Routes.draw do |map|
  map.resources :friends

  map.resources :trip_features

  map.resources :user_preferences

  map.resources :purchases

  map.resources :trips
  
  map.resource :user_session
  map.root :controller => "trips", :action => "index" 

  
  map.resource :account, :controller => "users"
  map.resources :users
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
