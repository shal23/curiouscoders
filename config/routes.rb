Curiouscoders::Application.routes.draw do

  resources :teams


  authenticated :user do
	  root :to => 'home#index'
  end

  root :to => "home#index"
  
  devise_for :users
  resources :users 
  resources :tutorials 
  
end