Rails.application.routes.draw do
  resources :reviews
  resources :reading_lists
  resources :books
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
