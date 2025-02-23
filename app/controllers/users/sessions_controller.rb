class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    # Authenticate using Devise's built-in warden method.
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)

    # For API, you might want to return a JWT token
    token = generate_jwt(resource)
    render json: { token: token, user: resource }, status: :ok
  end

  private

  def generate_jwt(user)
    # Example using the jwt gem; adjust secret source as needed.
    JWT.encode({ user_id: user.id, exp: 24.hours.from_now.to_i }, Rails.application.credentials.secret_key_base)
  end
end
