Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"} do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :posts do
    resources :comments
  end
  
  resource :user, only: [:edit] do
  collection do
    patch 'update_password'
    patch 'update_info'
    patch 'update_email'
  end
  end
  
  root :to => "posts#index"
end
