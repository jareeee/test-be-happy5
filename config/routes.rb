Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

   # namespace the controllers without affecting the URI
   scope module: :v2, constraints: ApiVersion.new('v2') do
    resources :todos, only: :index
   end
   scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :todos do
      resources :items
    end
   end


  # route login
  post 'auth/login', to: 'authentication#authenticate'
  # route signup
  post 'signup', to: 'users#create'
end
