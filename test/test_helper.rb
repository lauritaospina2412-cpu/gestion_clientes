# Configurar SimpleCov antes de cargar Rails
require "simplecov"
SimpleCov.start "rails"

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "json"
require "fileutils"

module JsonTestHelper
  DATA_FILE = File.expand_path("../../data/clients.json", __dir__)

  # Contenido inicial de clients.json
  def default_clients
    [
      { "id" => "1", "name" => "Juan Pérez", "email" => "juan.perez@example.com", "phone" => "3001234567" },
      { "id" => "2", "name" => "María Gómez", "email" => "maria.gomez@example.com", "phone" => "3209876543" },
      { "id" => "3", "name" => "Carlos Rodríguez", "email" => "carlos.rodriguez@example.com", "phone" => "3116549870" }
    ]
  end

  # Asegura que el archivo exista
  def ensure_data_file
    dir = File.dirname(DATA_FILE)
    FileUtils.mkdir_p(dir) unless Dir.exist?(dir)
    # Crear el archivo solo si no existe, sin llamar de nuevo a write_clients
    unless File.exist?(DATA_FILE)
      File.write(DATA_FILE, JSON.pretty_generate({ "clients" => default_clients }))
    end
  end

  # Leer clientes del archivo JSON
  def read_clients
    ensure_data_file
    JSON.parse(File.read(DATA_FILE))["clients"]
  end

  # Escribir clientes en el archivo JSON
  def write_clients(clients)
    ensure_data_file
    File.write(DATA_FILE, JSON.pretty_generate({ "clients" => clients }))
  end

  # Restaurar JSON a su estado inicial
  def reset_clients
    File.write(DATA_FILE, JSON.pretty_generate({ "clients" => default_clients }))
  end
end

class ActiveSupport::TestCase
  include JsonTestHelper

  # Ejecutar tests en paralelo con número de procesadores
  parallelize(workers: :number_of_processors)

  # Llamar a reset_clients antes de cada test
  setup do
    reset_clients
  end
end
