Rails.application.routes.draw do
  root "consultas#index"

  post "/consultas", to: "consultas#create"
  get "/resultado/:id", to: "consultas#resultado", as: "resultado"
  get "/historico", to: "consultas#historico"
end
