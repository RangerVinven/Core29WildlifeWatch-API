class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    decoded_token = jwt_decode(token)
    user_id = decoded_token && decoded_token['user_id']
    @current_user = User.find_by(id: user_id)
    
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
  rescue JWT::DecodeError
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  private

  def jwt_decode(token)
    JWT.decode(token, Rails.application.credentials.secret_key_base).first
  end
end
