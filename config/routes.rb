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
  get 'cards/import'
  get 'cards/browse'
  post 'cards/import_cards'
  get 'cards/public_board'
  get 'complexities/index'
  get 'impacts/index'
  get 'review/index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
