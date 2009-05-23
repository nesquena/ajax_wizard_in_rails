ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'computers'
  map.resources :computers
end
