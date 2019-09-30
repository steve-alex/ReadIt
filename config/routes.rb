Rails.application.routes.draw do
  resources :users, except: [:index]
  resources :reviews, except: [:index]
  resources :reading_lists, include: [:index, :show, :edit, :update]
  resources :books, include: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
