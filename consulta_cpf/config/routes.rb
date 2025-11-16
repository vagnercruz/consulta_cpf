Rails.application.routes.draw do
  root "consultas#index"

  post "/consultas", to: "consultas#create"
  get "/resultado/:id", to: "consultas#resultado", as: "resultado"
  get "/historico", to: "consultas#historico"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
