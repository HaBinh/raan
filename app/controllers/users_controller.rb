class UsersController < ApplicationController
  
  before_action :only_manager, only: [:index, :update]
  before_action :users_params, only: [:update]
  before_action :set_user, only: [:update]
  
  def index
    @users = User.all
  end

  def update
    @user.update_attributes(users_params)
    render json: { data: @user } 
  end

  private 

  def set_user
    @user = User.find_by(email: params[:id])
  end

  def users_params
    params.permit(:role, :name)
  end
  
  def only_manager
    unless current_user.isManager 
      render json: { message: 'You are not manager'}, status: :unprocessable_entity
    end
  end
end
