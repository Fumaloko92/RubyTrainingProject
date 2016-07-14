Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"} do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :posts do
    resources :comments
  end
  
  resource :user do
    collection do
      patch 'update_password'
      patch 'update_info'
      patch 'update_email'
    end
    
    member do
      get 'profile_page'
    end
  end
  
  root "posts#index"
end
