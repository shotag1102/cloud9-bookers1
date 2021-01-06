Rails.application.routes.draw do
  devise_for :users
  root :to => 'home#top'
  get "home/about"
  resources :users, only: [:index, :show, :edit, :create, :update] 
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]  do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
 end
end
