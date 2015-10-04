Rails.application.routes.draw do
  
  root 'pages#index'
  devise_for :users
  resources :users do
    resources :build, controller: 'users/build'
  end
  
end
