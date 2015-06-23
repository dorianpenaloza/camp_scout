Rails.application.routes.draw do

  root 'camps#index'

  resources :camps
  resources :compares
  post "/compares/drop" => "compares#drop"
  get "/search" => "camps#search"

end
