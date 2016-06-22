Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :posts do
    resources :comments
  end
  
  
  root :to => "posts#index"
end
