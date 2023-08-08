Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :spells
  resources :charms

  post '/calculate_damage', to: 'attack#calculate_damage'
end
