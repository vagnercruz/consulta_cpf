module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :logged_in?, :admin?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def admin?
    logged_in? && current_user.admin?
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "Você precisa estar logado para acessar esta página."
    end
  end

  def require_admin
    unless admin?
      redirect_to root_path, alert: "Apenas administradores podem acessar este conteúdo."
    end
  end
end
