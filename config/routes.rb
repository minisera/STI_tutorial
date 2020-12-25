Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resource :likes, only: [:create,:destroy]
    resource :comments, only: [:create,:destroy]
  end
  resources :users
  resources :books do
    resource :comments, only: [:create,:destroy]
  end
    resources :clothes
end
