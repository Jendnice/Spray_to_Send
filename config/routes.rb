Rails.application.routes.draw do

  get 'climbs/grouped_ratings', to: 'climbs#ratings'

  resources :reviews
  resources :climbs do
    resources :reviews, only: [:new, :show, :index]
  end 

  resources :locations
  
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
  end

  root to: 'application#welcome'
  get 'home', to: 'application#home'

  get '/search', to: 'climbs#search'

  
end




