class SessionsController < ApplicationController
  # Excluir login de la autenticación básica
  skip_before_action :authenticate, only: [:new, :create]

  def new
    # formulario de login
  end

  def create
    if params[:username] == "admin" && params[:password] == PASS
      session[:logged_in] = true
      redirect_to clients_path
    else
      flash[:alert] = "Usuario o contraseña incorrectos"
      render :new
    end
  end

  def destroy
    session[:logged_in] = nil
    redirect_to login_path
  end
end
