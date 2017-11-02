class UsersController < ApplicationController
  
  before_action :only_manager, only: [:index]
  
  def index
    @users = User.all
  end

  private 
  
  def only_manager
    unless current_user.isManager 
      render json: { message: 'You are not manager'}, status: :unprocessable_entity
    end
  end
end
