class ApplicationController < ActionController::API
  respond_to :json
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!, unless: :devise_controller?
end

# class ApplicationControllerAPI < ApplicationController 
#   before_action :authenticate_user!	
# end
