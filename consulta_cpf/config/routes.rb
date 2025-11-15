Rails.application.routes.draw do
  root "consultas#index"

  post "/consultas", to: "consultas#create"
  get "/historico", to: "consultas#historico"
end
