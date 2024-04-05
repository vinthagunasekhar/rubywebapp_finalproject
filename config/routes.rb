Rails.application.routes.draw do
  root 'sessions#new'  # Set the login page as the root path
  get 'signup', to: 'users#new', as: :signup  # Path to sign up new users
  post 'users', to: 'users#create'

  get 'login', to: 'sessions#new', as: 'login'            # Route for login page
  post 'login', to: 'sessions#create'                     # Logs in the user
  delete 'logout', to: 'sessions#destroy', as: 'logout'   # Logs out the user

  resources :users, only: [:show] do
    resource :profile  # Notice the singular 'resource' for the one-to-one relationship
  end

  resources :media do
    resources :episodes, except: [:index]  # Nested resource for episodes
  end

  # Optional health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
