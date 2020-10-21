Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :edit, :update, :show]
<<<<<<< HEAD
  resources :lessons, except: :destroy
  get '/profile', to: 'users#show'
=======
>>>>>>> 96e0186f5267f6cb6617690fd86ea5d4f167df14

  root 'welcome#home'

  #for payments (not tested)
  devise_for :users
  get '/', to: 'transactions#index'
  post '/transactions/submit', to: 'transactions#submit'

end
