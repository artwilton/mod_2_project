Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :skills, only: [:show]
  resources :users, only: [:update, :destroy, :show]# do we still need show, or rename???
  resources :lessons, except: :destroy
  get '/profile', to: 'users#profile'
  get '/profile/edit', to: 'users#edit'

  root 'welcome#home'

  #for payments (not tested)
  devise_for :users
  get '/', to: 'transactions#index'
  post '/transactions/submit', to: 'transactions#submit'

end
