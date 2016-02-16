Rails.application.routes.draw do
  resources :appointments
  resources :users
  resources :service_centers
  resources :advisors
  resources :vehicles
  resources :countries

  namespace "api" do
  	resources "sesiones", controller: "sessions", only: [:create]
  end

end
