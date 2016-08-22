Rails.application.routes.draw do

  root 'static_pages#home'

  get 'visited', to: 'static_pages#visited'

  resources :trips do
    resources :locations
    resources :pack_items
  end
  resources :locations do
  	resources :addresses
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
