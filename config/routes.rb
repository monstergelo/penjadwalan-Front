Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  get 'home/index'
  match "home/data", :to => "home#data", :as => "data", :via => "get"
  match "home/fetch", :to => "home#fetch", :as => "fetch", :via => "get"
  match "home/schedule", :to => "home#schedule", :as => "schedule", :via => "get"
  match "home/req_post", :to => "home#req_post", :as => "req_post", :via => "get"
  match "home/ask_permission", :to => "home#ask_permission", :as => "ask_permission", :via => "get"
  match "home/db_action", :to => "home#db_action", :as => "db_action", :via => "get"
  match "home/calendar_action", :to => "home#calendar_action", :as => "calendar_action", :via => "get"
  match "home/permission_action", :to => "home#permission_action", :as => "permission_action", :via => "post"
  match "home/login", :to => "home#login", :as => "login", :via => "get"
  match "home/get_email", :to => "home#get_email", :as => "get_email", :via => "post"
  match "home/get_code", :to => "home#get_code", :as => "get_code", :via => "post"
  match "home/get_periode", :to => "home#get_periode", :as => "get_periode", :via => "post"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #TEST
  match "home/login2", :to => "home#login2", :as => "login2", :via => "get"
  match "home/login3", :to => "home#login3", :as => "login3", :via => "get"
  match "home/periode", :to => "home#periode", :as => "periode", :via => "get"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"

  get '/redirect', to: 'home#redirect', as: 'redirect'
  get '/callback', to: 'home#callback', as: 'callback'
  get '/calendars', to: 'home#calendars', as: 'calendars'

  get '/events/:calendar_id', to: 'home#events', as: 'events', calendar_id: /[^\/]+/
  post '/events/:calendar_id', to: 'home#new_event', as: 'new_event', calendar_id: /[^\/]+/
end
