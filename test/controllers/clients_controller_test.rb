require "test_helper"

class ClientsControllerTest < ActionDispatch::IntegrationTest
  include JsonTestHelper

  def setup
    reset_clients
    # Simular autenticación HTTP Basic
    @auth_headers = {
      "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials("admin", "admin123")
    }
  end

  test "index shows all clients" do
    get clients_path, headers: @auth_headers
    assert_response :success
    assert_equal 3, assigns(:clients).size
  end

  test "create a new client" do
    post clients_path,
         params: { client: { name: "Ana Torres", email: "ana@example.com", phone: "3123456789" } },
         headers: @auth_headers

    assert_redirected_to clients_path
    follow_redirect!
    assert_match "Cliente creado con éxito", flash[:notice]

    clients = read_clients
    assert clients.any? { |c| c["name"] == "Ana Torres" }
  end

  test "update a client" do
    patch client_path("1"),
          params: { client: { name: "Juan Actualizado" } },
          headers: @auth_headers

    assert_redirected_to clients_path
    follow_redirect!
    assert_match "Cliente actualizado correctamente", flash[:notice]

    client = read_clients.find { |c| c["id"] == "1" }
    assert_equal "Juan Actualizado", client["name"]
  end

  test "destroy a client" do
    delete client_path("2"), headers: @auth_headers

    assert_redirected_to clients_path
    follow_redirect!
    assert_match "Cliente eliminado correctamente", flash[:notice]

    clients = read_clients
    refute clients.any? { |c| c["id"] == "2" }
  end
end
