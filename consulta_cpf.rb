require 'httparty'
require 'json'
require_relative 'validador'

class ConsultaCPF
  def self.consultar(cpf)
    return unless ValidadorCPF.validar(cpf)

    puts "Consultando informações..."

    sleep(1)

    dados = {
      cpf: cpf,
      nome: "João da Silva",
      status: "Ativo",
      situacao_cadastral: "Regular"
    }

    puts "Dados encontrados para o CPF #{cpf}:"
    puts JSON.pretty_generate(dados)
  end
end
