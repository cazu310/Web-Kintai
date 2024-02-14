# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  # before_action :check_authentication

  private

  # def check_authentication
  #   puts current_employee.inspect
  #   unless current_employee
  #     redirect_to new_session_path
  #   end
  # end
end
