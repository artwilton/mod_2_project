Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create]
  get '/profile', to: 'users#show'

  root 'welcome#home'

  #for payments (not tested)
  devise_for :users
  get '/', to: 'transactions#index'
  post '/transactions/submit', to: 'transactions#submit'

end
