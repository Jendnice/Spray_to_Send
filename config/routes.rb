Rails.application.routes.draw do

  get 'climbs/grouped_ratings', to: 'climbs#ratings'

  resources :reviews
  resources :climbs do
    resources :reviews, only: [:new, :index]
  end 

  resources :locations
  devise_for :users, :controllers => {registrations: 'registrations'}
  root to: 'application#welcome'

end




