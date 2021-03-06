BlacksCorner::Application.routes.draw do

	root :controller => 'sessions', :action => 'aboutme'
		
	resources :sessions
	match "login", :to => "sessions#login"
	match "home", :to => "sessions#home"
	match "logout", :to => "sessions#logout"	
	match "login_attempt", :to => "sessions#login_attempt"
	match "smfr", :to => "sessions#symptons_medicines_foods_relationships"
	match "sfr", :to => "sessions#symptons_food_relationships"
  
  resources :users
  match "signup", :to => "users#new"
  match "create", :to => "users#create"
  
  resources :foods
  match "add_food", :to => "foods#new"
  match "create_food", :to => "foods#create"
  match "show_foods", :to => "foods#show"
  match "edit_food/:id", :to => "foods#edit", :as => :edit_food
  match "delete_food/:id", :to => "foods#destroy", :as => :delete_food
  
  resources :meals
  match "add_meal", :to => "meals#new"
  match "create_meal", :to => "meals#create"
  match "show_meals", :to => "meals#show"
  match "show_single_day/:id", :to => "meals#single_day", :as => :show_single_day
  match "edit_meal/:id", :to => "meals#edit", :as => :edit_meal
  match "delete_meal/:id", :to => "meals#destroy", :as => :delete_meal
  
  resources :medicines
  match "add_medicine", :to => "medicines#new"
  match "create_medicine", :to => "medicines#create"
  match "show_medicines", :to => "medicines#show"
  match "edit_medicine/:id", :to => "medicines#edit", :as => :edit_medicine
  match "delete_medicine/:id", :to => "medicines#destroy", :as => :delete_medicine
  
  resources :symptons
  match "add_sympton", :to => "symptons#new"
  match "create_sympton", :to => "symptons#create"
  match "show_symptons", :to => "symptons#show"
  match "edit_sympton/:id", :to => "symptons#edit", :as => :edit_sympton
  match "delete_sympton/:id", :to => "symptons#destroy", :as => :delete_sympton
  	
end
