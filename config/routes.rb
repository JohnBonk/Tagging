Rails.application.routes.draw do
  
  root 'welcome#index'


  resources :posts
  resources :tags

  get 'posts/', to: 'posts#index'

  get 'about/', to: 'about#index'

  get 'search/(:tag1)(/:tag2)(/:tag3)', to: 'search#index', as: :search

  post 'tags/(:id)', to: 'tags#destroy', as: :delete_tag
end
