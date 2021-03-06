Rails.application.routes.draw do
  # restful listings routes
  resources :listings
  devise_for :users
  root 'home#page'
# routes for specific user shops and listings
resources :listings, path: '/:username/listings', as: :shop do
  put :favourite, on: :member
end

# routes for webhook
post "/payments/webhook", to: "payments#webhook"

# routes for successful payment
get "/payments/success", to: "payments#success"

# routes for faves
 get ':username/favourites', to: 'listings#fave_list', as: :faves

 # routes for shopping cart
post 'listings/add_to_cart/:id', to: 'listings#add_to_cart', as: 'add_to_cart'
delete 'listings/remove_from_cart/:id', to: 'listings#remove_from_cart', as: 'remove_from_cart'

end
