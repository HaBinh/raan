class User::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def create
    super
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :name << :role
  end
end