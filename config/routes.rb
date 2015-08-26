Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :trips
  
  root "trips#index"
  get  'about'   => 'landing#about'
end
