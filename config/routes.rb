ActionController::Routing::Routes.draw do |map|  
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new" 
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.resource :account, :controller => "users"
  map.resources :users
end
