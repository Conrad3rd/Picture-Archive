Rails.application.routes.draw do
  get "hash/remove/:id", to: 'picturehash#remove', as: 'picture_hash_remove'
  get 'hash/add', to: 'picturehash#add', as: 'picture_hash_add'

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
