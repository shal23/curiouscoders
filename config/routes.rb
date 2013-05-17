Curiouscoders::Application.routes.draw do
  
  resources :conversations


  devise_for :users
  resources :users 
  resources :tutorials 
  resources :posts
  resources :teams

  authenticated :user do
	  root :to => 'home#index'
  end

  authenticated :admin do
    get "admin/index", :id => "admin"
    match "admin" => "admin#index"
  end

  root :to => "home#index"
  
end