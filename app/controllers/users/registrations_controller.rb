# frozen_string_literal: true

# class Users::RegistrationsController < Devise::RegistrationsController
class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!, only: [:create]  # Skip authentication for sign-up

  private

  # Customize which fields are permitted
  def sign_up_params
    params.permit(:username, :first_name, :last_name, :email, :password)
  end
end
# end
