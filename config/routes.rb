Rails.application.routes.draw do
  resources :articles
  resources :posts
  resources :blogs
  root 'posts#index'
end
