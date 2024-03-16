Rails.application.routes.draw do
  get 'web/bootstrap'
  scope '/' do
    post 'login', to: 'sessions#create'
  end

  resources :events do
    # localhost:3000/events/1/join
    post 'join', to: 'events#join'
    
    # localhost:3000/events/1/leave
    delete 'leave', to: 'events#leave'
  end
  scope :profiles do
    get ':username', to: "profiles#show"
  end
  
  resources :posts
  resources :users do
    get 'posts', to: "users#posts_index"
  end
  
  resources :sports
  # localhost:3000/users does not work for me, use http://127.0.0.1:3000/users
  # get '/users', to: 'users#index'

  # # http://127.0.0.1:3000/users/1
  # get '/users/:id', to: 'users#show'

  # # http://127.0.0.1:3000/users
  # post '/users', to: 'users#create'

  # # http://127.0.0.1:3000/users/1
  # put '/users/:id', to: 'users#update'

  # # http://127.0.0.1:3000/users/1
  # delete '/users/:id', to: 'users#destroy'


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
