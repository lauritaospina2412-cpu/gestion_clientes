require "json"

class ClientRepository
  FILE = Rails.root.join("data", "clients.json")

  def self.all
    JSON.parse(File.read(FILE))["clients"]
  end

  def self.find(id)
    all.find { |c| c["id"] == id }
  end

  def self.save_all(clients)
    File.write(FILE, JSON.pretty_generate({ "clients" => clients }))
  end

  def self.create(attrs)
    clients = all
    new_client = { "id" => SecureRandom.uuid }.merge(attrs)
    clients << new_client
    save_all(clients)
    new_client
  end

  def self.update(id, attrs)
    clients = all
    index = clients.find_index { |c| c["id"] == id }
    return nil unless index
    clients[index] = clients[index].merge(attrs)
    save_all(clients)
    clients[index]
  end

  def self.delete(id)
    clients = all
    before = clients.length
    clients.reject! { |c| c["id"] == id }
    save_all(clients)
    clients.length < before
  end
end
