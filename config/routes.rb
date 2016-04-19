Rails.application.routes.draw do
  root to: "dashboards#show"
  resource :dashboard, only: :show
  resources :stories, only: [:index, :show]
  resources :api_responses, only: [:index, :show]
  resources :photos, only: [:index, :show]
  get "/download", to: "downloads#start"
  get "/search", to: "searches#show"
end
