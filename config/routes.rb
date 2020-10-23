Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :lessons, except: :destroy
  

  resources :users, only: [:index, :destroy, :show]
  get '/profile' => 'users#profile'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/profile/edit' => 'users#edit'
  patch '/profile/edit' => 'users#edit'

  resources :skills
  resources :progresses, only: [:create, :update, :show]


  root 'welcome#home'
  get '/restricted' => 'welcome#restricted'


  #for payments (not tested)
  devise_for :users
  get '/', to: 'transactions#index'
  post '/transactions/submit', to: 'transactions#submit'

end
