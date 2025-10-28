class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:username] == "admin" && params[:password] == "admin123"
      session[:logged_in] = true
      redirect_to clients_path
    else
      flash[:alert] = "Credenciales incorrectas"
      render :new
    end
  end

  def destroy
    session[:logged_in] = false
    redirect_to login_path
  end
end
