Rails.application.routes.draw do
  root to: "dashboards#show"

  resource :dashboard, only: :show

  resources :stories, only: [:index, :show]

  resources :api_responses, only: [:index, :show]

  get "/download", to: "downloads#start"
end
