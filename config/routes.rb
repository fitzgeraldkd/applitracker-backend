Rails.application.routes.draw do
  resources :events
  resources :communications
  resources :jobs
  resources :users, only: [:create]
  get '/me', to: 'users#show'
  post '/login', to: 'sessions#create'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
