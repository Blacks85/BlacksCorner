BlacksCorner::Application.routes.draw do
	
	root :controller => 'sessions', :action => 'login'
	
	resources :sessions
	match "login", :to => "sessions#login"
	match "home", :to => "sessions#home"
	match "logout", :to => "sessions#logout"	
	match "login_attempt", :to => "sessions#login_attempt"
  
  resources :users
  match "signup", :to => "users#new"
  match "create", :to => "users#create"
  
  resources :foods
  match "add_food", :to => "foods#new"
  match "create_food", :to => "foods#create"
  match "show_foods", :to => "foods#show"
  match "delete_food/:id", :to => "foods#destroy", :as => :delete_food
  
  resources :meals
  match "add_meal", :to => "meals#new"
  match "create_meal", :to => "meals#create"
  match "show_meals", :to => "meals#show"
  match "delete_meal/:id", :to => "meals#destroy", :as => :delete_meal
  	
end
