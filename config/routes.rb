Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :items
  resources :activities
  resources :checklists
  devise_for :users
  resources :user
  resources :home
  root 'home#index'
  get 'user/:id' => 'user#show'
  post 'checklist/:id' => 'user#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
