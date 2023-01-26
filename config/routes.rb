Rails.application.routes.draw do
  root 'short_urls#index'

  resources :short_urls, only: [:index, :new, :create] do
    resources :geolocations
  end
  get '/:short_path',  to: 'short_urls#redirect'
end
