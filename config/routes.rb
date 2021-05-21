Rails.application.routes.draw do
  get '/', to: 'application#welcome'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/babies/:baby_id/events/new', to: 'events#create'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/search', to: 'events#search'
  resources :users
  resources :babies do
    resources :events
  end
  resources :events
end
