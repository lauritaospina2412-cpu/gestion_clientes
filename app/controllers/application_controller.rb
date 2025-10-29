class ApplicationController < ActionController::Base
  USER = "admin"
  PASS = ENV["ADMIN_PASSWORD"] || "admin123"

  # Protege todas las acciones por HTTP Basic Auth
  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_basic do |user, pass|
      user == USER && pass == PASS
    end
  end
end
