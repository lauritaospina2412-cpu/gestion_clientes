require "test_helper"

class ClientsFlowTest < ActionDispatch::IntegrationTest
  include JsonTestHelper

  def setup
    reset_clients
    @session = { logged_in: true } # Simular usuario logueado
  end

  test "full CRUD flow" do
    # INDEX
    get clients_path, session: @session
    assert_response :success
    assert_equal 3, assigns(:clients).size

    # CREATE
    post clients_path, params: { client: { name: "Ana Torres", email: "ana@example.com", phone: "3123456789" } }, session: @session
    assert_redirected_to clients_path
    follow_redirect!
    assert_match "Cliente creado con éxito", flash[:notice]
    clients = read_clients
    assert clients.any? { |c| c["name"] == "Ana Torres" }

    # SHOW / EDI
    get edit_client_path("1"), session: @session
    assert_response :success

    # UPDATE
    patch client_path("1"), params: { client: { name: "Juan Actualizado" } }, session: @session
    assert_redirected_to clients_path
    follow_redirect!
    assert_match "Cliente actualizado correctamente", flash[:notice]
    client = read_clients.find { |c| c["id"] == "1" }
    assert_equal "Juan Actualizado", client["name"]

    # DESTROY
    delete client_path("2"), session: @session
    assert_redirected_to clients_path
    follow_redirect!
    assert_match "Cliente eliminado correctamente", flash[:notice]
    clients = read_clients
    refute clients.any? { |c| c["id"] == "2" }
  end
end
