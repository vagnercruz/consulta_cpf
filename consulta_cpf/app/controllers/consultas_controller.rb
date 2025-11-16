class ConsultasController < ApplicationController
  before_action :require_login

  def index
    @consulta = Consulta.new
  end

  def create
    @consulta = current_user.consultas.build(consulta_params)

    if @consulta.save
      redirect_to resultado_path(@consulta)
    else
      render :index
    end
  end

  def historico
    if admin?
      @consultas = Consulta.includes(:user).order(created_at: :desc)
    else
      @consultas = current_user.consultas.order(created_at: :desc)
    end
  end

  private

  def consulta_params
    params.require(:consulta).permit(:cpf)
  end
end
