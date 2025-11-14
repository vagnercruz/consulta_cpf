require 'sinatra'
require 'cpf_cnpj'
require 'json'
require 'fileutils'

HISTORICO_PATH = 'data/historico.json'

FileUtils.mkdir_p('data')
File.write(HISTORICO_PATH, '[]') unless File.exist?(HISTORICO_PATH)

helpers do
  def carregar_historico
    JSON.parse(File.read(HISTORICO_PATH))
  end

  def salvar_historico(historico)
    File.write(HISTORICO_PATH, JSON.pretty_generate(historico))
  end
end

get '/' do
  erb :index
end

post '/validar' do
  cpf = params[:cpf].to_s.gsub(/\D/, '')
  @cpf_formatado = CPF.new(cpf).formatted
  @valido = CPF.valid?(cpf)


  historico = carregar_historico
  historico << {
    cpf: @cpf_formatado,
    valido: @valido,
    data: Time.now.strftime('%d/%m/%Y %H:%M:%S')
  }
  historico = historico.last(10)
  salvar_historico(historico)

  erb :resultado
end

get '/historico' do
  @historico = carregar_historico.reverse
  erb :historico
end

post '/historico/limpar' do
  salvar_historico([])
  redirect '/historico'
end
