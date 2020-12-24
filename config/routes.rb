Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users
  resources :books
  resources :clothes
end
