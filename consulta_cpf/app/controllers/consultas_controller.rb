class ConsultasController < ApplicationController
  require "cpf_cnpj"

  def index
    @consulta = Consulta.new
  end

  def create
    cpf_raw = params[:consulta][:cpf].to_s
    cpf_num = cpf_raw.gsub(/\D/, "")

    if cpf_num.length != 11
      flash[:alert] = "CPF incompleto!"
      return redirect_to root_path
    end

    valido = CPF.valid?(cpf_num)
    cpf_formatado = CPF.new(cpf_num).formatted

    @consulta = Consulta.create!(
      cpf: cpf_formatado,
      valido: valido,
      data: Time.current
    )

    redirect_to resultado_path(@consulta.id)
  end

  def resultado
    @consulta = Consulta.find(params[:id])
  end

  def historico
    @consultas = Consulta.order(data: :desc).limit(30)
  end
end
