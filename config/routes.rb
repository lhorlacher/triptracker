Rails.application.routes.draw do

  root 'static_pages#home'

  resources :trips do
    resources :locations
  end

  resources :locations do
    resources :addresses
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
