class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user!, only: [:login]

  def login
    user = User.find_by_email(params[:email])
    
    if user && user.valid_password?(params[:password])
      token = jwt_encode(user_id: user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def logout
    # Here, we just handle the client-side deletion of the token (optional).
    head :no_content
  end

  private

  def jwt_encode(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end
end
