Rails.application.routes.draw do
  resources :posts
  resources :blogs
  root 'posts#index'
end
