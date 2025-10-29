# Configurar SimpleCov antes de cargar Rails
require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module JsonTestHelper
  DATA_FILE = File.expand_path("../../data/clients.json", __dir__)

  def read_clients
    JSON.parse(File.read(DATA_FILE))["clients"]
  end

  def write_clients(clients)
    File.write(DATA_FILE, JSON.pretty_generate({ "clients" => clients }))
  end

  def reset_clients
    # opcional: restaurar JSON a estado inicial antes de cada test
    default_clients = [
      { "id" => "1", "name" => "Juan Pérez", "email" => "juan.perez@example.com", "phone" => "3001234567" },
      { "id" => "2", "name" => "María Gómez", "email" => "maria.gomez@example.com", "phone" => "3209876543" },
      { "id" => "3", "name" => "Carlos Rodríguez", "email" => "carlos.rodriguez@example.com", "phone" => "3116549870" }
    ]
    write_clients(default_clients)
  end
end

