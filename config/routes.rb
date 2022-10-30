Rails.application.routes.draw do
  get 'picturehash/destroy/:id', to: 'picturehash#destroy', as: 'picturehash'
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
