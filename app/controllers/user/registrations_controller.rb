class User::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :authenticate_user!
  before_action :only_manager, only: [:create, :destroy]
  
  # before_action :only_manager_or_correct_user, only: [:update]

  def create
    super
  end

  private 
  
  def only_manager
    unless current_user.isManager 
      render json: { message: 'You are not manager'}, status: :unprocessable_entity
    end
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :role])
  end

end