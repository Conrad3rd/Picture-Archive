Rails.application.routes.draw do
  # resources :movies, only: :index
  # get 'pictures/', to: 'pictures#index', as: 'pictures'
  get 'hash/show_hashs/:id', to: 'picture#show', as: 'show_hashs'

  get 'hash/index/:id', to: 'picturehash#index', as: 'picture_hash_index'
  get 'hash/show/:id', to: 'picturehash#show', as: 'picture_hash_show'
  get "hash/remove/:id", to: 'pictures#remove', as: 'picture_hash_remove'
  get 'hash/add', to: 'pictures#add', as: 'picture_hash_add'

  #resources :uploads

  resources :pictures, only: %i[index show]
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources :users do
  #   resources :pictures, only: %i[show]
  # end

  # get picturehash
  # get '/patients/:id', to: 'patients#show'
end
