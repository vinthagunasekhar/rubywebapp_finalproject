Rails.application.routes.draw do
  # Devise setup for HTML responses
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Root routing for authenticated and unauthenticated states
  devise_scope :user do
    authenticated :user do
      root to: 'media#index', as: :authenticated_root  # Redirect authenticated users to the media index
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root  # Redirect unauthenticated users to the login page
    end
  end

  # API routes under the `api/v1` namespace
  namespace :api do
    namespace :v1 do
      # Devise routes for API authentication
      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations'
      }, skip: [:sessions, :registrations]

      devise_scope :user do
        post 'users/sign_in', to: 'users/sessions#create', as: :user_login
        delete 'users/sign_out', to: 'users/sessions#destroy', as: :user_logout
        post 'users', to: 'users/registrations#create', as: :user_registration
      end

      # Additional API routes for media
      resources :media, only: [:index, :show]
      resource :profile, only: [:create, :update]
      # Define any other routes for your API
    end
  end

  # Non-API resources for HTML interface
  resources :media do
   resources :episodes, except: [:index]
  end

  resources :users, only: [:show] do
    resource :profile
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
