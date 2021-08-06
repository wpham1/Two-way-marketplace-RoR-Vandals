Rails.application.routes.draw do
  resources :listings
  devise_for :users
  root 'home#page'

#  get ':username', to: 'listings#shop'
#  get ':username/:id', to: 'listings#show'

#  scope ':username' do
#   resources :listings
# end

resources :listings, path: '/:username/listings', as: :shop


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
