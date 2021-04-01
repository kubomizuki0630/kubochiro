Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'tweets/index' => 'tweets#index'
  get 'tweets/new' => 'tweets#new'
  get 'tweets/owner' => 'tweets#owner'
  post 'tweets' => 'tweets#create'
  
  root 'posts#index'
  get 'posts/new' => 'posts#new'
  get 'posts/reizoko' => 'posts#reizoko'
  post 'posts' => 'posts#create'
end
