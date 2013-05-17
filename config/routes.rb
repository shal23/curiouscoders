Curiouscoders::Application.routes.draw do

  resources :posts


  resources :teams do
  	member do
  		post :join
  		post :leave
  	end
  end
  


  match 'tagged' => 'tutorials#tagged', :as => 'tagged'
  authenticated :user do
	  root :to => 'home#index'
  end

  root :to => "home#index"
  
  devise_for :users
  resources :users 
  resources :tutorials 
  
end