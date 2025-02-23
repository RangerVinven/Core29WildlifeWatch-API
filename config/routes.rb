Rails.application.routes.draw do
  namespace :api do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :animals, only: [:index, :show]  # Read-only
      resources :spottings, only: [:index, :show, :create, :update, :destroy]
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # post '/api/login', to: 'authentication#login'
  # post '/api/logout', to: 'authentication#logout'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post '/login', to: 'authentication#login'

  # Defines the root path route ("/")
  # root "posts#index"
devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}
end


