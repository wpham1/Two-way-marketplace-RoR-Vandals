Rails.application.routes.draw do
  resources :listings
  devise_for :users
  root 'home#page'

#  get ':username', to: 'listings#shop'
#  get ':username/:id', to: 'listings#show'

#  scope ':username' do
#   resources :listings
# end

resources :listings, path: '/:username/listings', as: :shop do
  put :favourite, on: :member
end

# resources :listings, only: [:show, :update, :destroy], path: '/:username' do
#   put :favourite, on: :member
# end

# have to put favourite on member of listing

 get ':username/favourites', to: 'listings#fave_list', as: :faves
# put ':username/favourites', to: 'listings#favourite', as: :faves

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
