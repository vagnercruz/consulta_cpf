require 'sinatra'
require_relative 'validador'

set :bind, '0.0.0.0'
set :port, 4567

get '/' do
  erb :index
end

post '/validar' do
  cpf = params[:cpf].to_s.strip
  @cpf = cpf
  @valido = ValidadorCPF.validar(cpf)
  erb :resultado
end
