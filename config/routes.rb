ActionController::Routing::Routes.draw do |map|
  map.resources :purchases

  map.resources :trips
  
  map.resource :user_session
  map.root :controller => "trips", :action => "index" 
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.resource :account, :controller => "users"
  map.resources :users
end
