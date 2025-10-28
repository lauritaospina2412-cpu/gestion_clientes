class ApplicationController < ActionController::Base

  USER = "admin"
  PASS = "admin123"

  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_basic do |user, pass|
      user == USER && pass == PASS
    end
  end
  
end
