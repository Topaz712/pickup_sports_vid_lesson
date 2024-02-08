Rails.application.routes.draw do
  # localhost:3000/users does not work for me, use http://127.0.0.1:3000/users
  get '/users', to: 'users#index'

  # http://127.0.0.1:3000/users/1
  get '/users/:id', to: 'users#show'

  # http://127.0.0.1:3000/users
  post '/users', to: 'users#create'

  # http://127.0.0.1:3000/users/1
  put '/users/:id', to: 'users#update'

  # http://127.0.0.1:3000/users/1
  delete '/users/:id', to: 'users#destroy'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
