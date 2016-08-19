Rails.application.routes.draw do

  root 'static_pages#home'

  resources :trip do
    resources :location
  end

  resources :location do
    resources :address
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
