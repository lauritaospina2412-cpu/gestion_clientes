# Configurar SimpleCov antes de cargar Rails
require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module JsonTestHelper
  DATA_FILE = File.expand_path("../../data/clients.json", __dir__)

  def ensure_data_file
    dir = File.dirname(DATA_FILE)
    Dir.mkdir(dir) unless Dir.exist?(dir)

    unless File.exist?(DATA_FILE)
      write_clients([
        { "id" => "1", "name" => "Juan Pérez", "email" => "juan.perez@example.com", "phone" => "3001234567" },
        { "id" => "2", "name" => "María Gómez", "email" => "maria.gomez@example.com", "phone" => "3209876543" },
        { "id" => "3", "name" => "Carlos Rodríguez", "email" => "carlos.rodriguez@example.com", "phone" => "3116549870" }
      ])
    end
  end

  def read_clients
    ensure_data_file
    JSON.parse(File.read(DATA_FILE))["clients"]
  end

  def write_clients(clients)
    ensure_data_file
    File.write(DATA_FILE, JSON.pretty_generate({ "clients" => clients }))
  end

  def reset_clients
    ensure_data_file
    default_clients = [
      { "id" => "1", "name" => "Juan Pérez", "email" => "juan.perez@example.com", "phone" => "3001234567" },
      { "id" => "2", "name" => "María Gómez", "email" => "maria.gomez@example.com", "phone" => "3209876543" },
      { "id" => "3", "name" => "Carlos Rodríguez", "email" => "carlos.rodriguez@example.com", "phone" => "3116549870" }
    ]
    write_clients(default_clients)
  end
end


