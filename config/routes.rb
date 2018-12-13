Rails.application.routes.draw do
  resources :cycles
  resources :settings
  resources :updates
  resources :impacts
  resources :complexities
  resources :proposals
  resources :users
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
