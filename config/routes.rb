Rails.application.routes.draw do
  root to: "dashboards#show"

  resource :dashboard, only: [:show]

  resources :stories, only: [:index, :show]
end
