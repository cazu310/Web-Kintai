# app/helpers/sessions_helper.rb

module SessionsHelper
  def log_in(employee)
    session[:employee_id] = employee.id
    @current_employee = employee  # @current_employee にも設定
    Rails.logger.debug "User logged in successfully: #{employee.login_id}"
  end

  def log_out
    session.delete(:employee_id)
    @current_employee = nil
  end

  def current_employee
    @current_employee ||= Employee.find_by(id: session[:employee_id])
    Rails.logger.debug "Current employee: #{@current_employee&.login_id}"
    @current_employee
  end

  def logged_in?
    !current_employee.nil?
  end
end
