class ClientsController < ApplicationController
    before_action :require_login
    before_action :set_client, only: [:edit, :update, :destroy]

    def index
        @clients = ClientRepository.all
    end

    def new
        @client = {}
    end

    def create
        client = ClientRepository.create(client_params.to_h)

        if client
            flash[:notice] = "Cliente creado con éxito."
            redirect_to clients_path
        else
            flash[:alert] = "Error al crear el cliente."
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        unless @client
            flash[:alert] = "Cliente no encontrado."
            redirect_to clients_path
        end
    end

    def update
        if ClientRepository.update(params[:id], client_params.to_h)
            flash[:notice] = "Cliente actualizado correctamente."
            redirect_to clients_path
        else
            flash[:alert] = "Error al actualizar el cliente."
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        if ClientRepository.delete(params[:id])
            flash[:notice] = "Cliente eliminado correctamente."
        else
            flash[:alert] = "Cliente no encontrado."
        end

        redirect_to clients_path
    end

    private

    def set_client
        @client = ClientRepository.find(params[:id])
    end

    def require_login
        redirect_to login_path unless session[:logged_in]
    end

    def client_params
        params.require(:client).permit(:name, :email, :phone)
    end
end
