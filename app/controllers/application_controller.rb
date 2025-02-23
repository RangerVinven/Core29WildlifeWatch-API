class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def authenticate_user!
    @current_user = User.first
  end

  private

  def jwt_decode(token)
    JWT.decode(token, Rails.application.credentials.secret_key_base).first
  end
end
