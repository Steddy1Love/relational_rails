Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get '/', to: 'welcome#index'
  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/new', to: 'manufacturers#new'
  post '/manufacturers', to: 'manufacturers#create'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:manufacturer_id/vehicles', to: 'manufacturer_vehicles#index'
  # patch "/manufacturers/:id", to: "manufacturers#update"
  # delete "/manufacturers/:id", to: "manufacturers#destroy"
  get '/vehicles', to: 'vehicles#index'
  get '/vehicles/:id', to: 'vehicles#show'
end
