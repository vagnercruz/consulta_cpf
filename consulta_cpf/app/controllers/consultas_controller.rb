class ConsultasController < ApplicationController
  require "cpf_cnpj"

  def index
    @consulta = Consulta.new
  end

  def create
    cpf_raw = params[:consulta][:cpf].to_s
    cpf_numero = cpf_raw.gsub(/\D/, "")

    if cpf_numero.length != 11
      flash[:alert] = "CPF incompleto!"
      return redirect_to root_path
    end

    valido = CPF.valid?(cpf_numero)
    cpf_formatado = CPF.new(cpf_numero).formatted

    Consulta.create!(
      cpf: cpf_formatado,
      valido: valido,
      data: Time.now
    )

    redirect_to historico_path
  end

  def historico
    @consultas = Consulta.order(data: :desc).limit(20)
  end
end
