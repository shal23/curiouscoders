Curiouscoders::Application.routes.draw do
  
  devise_for :users
  resources :users 
  resources :tutorials

  resources :messages do
    member do
      post :remove_recipient
      post :remove_sender
    end
  end

  resources :posts
  resources :conversations

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

  authenticated :admin do
    get "admin/index", :id => "admin"
    match "admin" => "admin#index"
  end

  root :to => "home#index"
  
end