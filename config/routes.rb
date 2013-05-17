Curiouscoders::Application.routes.draw do

  resources :posts


  resources :teams


  match 'tagged' => 'tutorials#tagged', :as => 'tagged'
  authenticated :user do
	  root :to => 'home#index'
  end

  root :to => "home#index"
  
  devise_for :users
  resources :users 
  resources :tutorials 
  
end