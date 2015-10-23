Rails.application.routes.draw do
  
  root 'pages#index'
  devise_for :users, :controllers => {
  	omniauth_callbacks: 'users/omniauth_callbacks',
  	:registrations => "users/registrations"
  }
  resources :users do
    resources :build, controller: 'users/build'
  end

  get "completed" => "pages#completed", as: :completed
  match "/dummy_endpoint" => "pages#dummy_endpoint", via: [:get, :post]
  
end
