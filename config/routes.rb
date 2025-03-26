Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "/items", to: "items#index"
  get "/items/:id", to: "items#show"
  post "/items", to: "items#create"
  delete "/items/:id", to: "items#delete"
end
