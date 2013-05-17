Curiouscoders::Application.routes.draw do
  #resources :tutorials

  match 'tagged' => 'tutorials#tagged', :as => 'tagged'
  authenticated :user do
  root :to => 'home#index'
  
  end

  root :to => "home#index"
  devise_for :users
  resources :users 
  resources :tutorials 
  
end