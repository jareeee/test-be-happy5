Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :todos do
    resources :items
  end

  # route login
  post 'auth/login', to: 'authentication#authenticate'
  # route signup
  post 'signup', to: 'users#create'
end
