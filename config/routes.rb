Rails.application.routes.draw do
  resources :tokens
  resources :scheduled_events
  resources :periods
  resources :rooms
  resources :sessions
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


  resources :pembimbings
  resources :pengujis
  resources :mahasiswas
  resources :dosens
  root 'home#index'

  get 'home/show'
  get 'home/index'
  get 'home/kerja_praktik'
  get 'home/seminar_satu'
  get 'home/seminar_dua'
  get 'home/sidang'
  get 'home/test_calendar_process'
  get 'home/tambah_mahasiswa'
  get 'home/index'
  get "home/routeSchedule/:event_type", :to => "home#routeSchedule", :as => "routeSchedule"
  get "home/routeFetchResult/:event_type", :to => "home#routeFetchResult", :as => "routeFetchResult"
  get "home/assign_sidang", :to => "home#assign_sidang", :as => "assign_sidang"
  match "home/data", :to => "home#data", :as => "data", :via => "get"
  match "home/fetch", :to => "home#fetch", :as => "fetch", :via => "get"
  match "home/schedule", :to => "home#schedule", :as => "schedule", :via => "get"
  match "home/req_post", :to => "home#req_post", :as => "req_post", :via => "get"
  match "home/fetch_result", :to => "home#fetch_result", :as => "fetch_result", :via => "get"
  match "home/req_post_form", :to => "home#req_post_form", :as => "req_post_form", :via => "get"
  match "home/send_json_post", :to => "home#send_json_post", :as => "send_json_post", :via => "post"
  match "home/test_request", :to => "home#test_request", :as => "test_request", :via => "get"
  match "home/ask_permission", :to => "home#ask_permission", :as => "ask_permission", :via => "get"
  match "home/db_action", :to => "home#db_action", :as => "db_action", :via => "get"
  match "home/result_calendar", :to => "home#result_calendar", :as => "result_calendar", :via => "get"
  match "home/receive_json_result", :to => "home#receive_json_result", :as => "receive_json_result", :via => "get"
  match "home/calendar_action", :to => "home#calendar_action", :as => "calendar_action", :via => "get"
  match "home/calendar_edit_action/", :to => "home#calendar_edit_action", :as => "calendar_edit_action", :via => "get"
  match "home/permission_action", :to => "home#permission_action", :as => "permission_action", :via => "post"
  match "home/login", :to => "home#login", :as => "login", :via => "get"
  match "home/get_email", :to => "home#get_email", :as => "get_email", :via => "post"
  match "home/get_code", :to => "home#get_code", :as => "get_code", :via => "post"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #FOR LOGIN2
  # match "home/login2", :to => "home#login2", :as => "login2", :via => "get"
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
