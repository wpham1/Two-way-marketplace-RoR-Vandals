Rails.application.routes.draw do
  resources :listings
  devise_for :users
  root 'home#page'
# routes for specific user shops and listings
resources :listings, path: '/:username/listings', as: :shop do
  put :favourite, on: :member
end

# routes for faves
 get ':username/favourites', to: 'listings#fave_list', as: :faves

post 'listings/add_to_cart/:id', to: 'listings#add_to_cart', as: 'add_to_cart'
delete 'listings/remove_from_cart/:id', to: 'listings#remove_from_cart', as: 'remove_from_cart'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
