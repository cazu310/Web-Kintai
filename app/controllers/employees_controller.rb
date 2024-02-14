class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show]

  def index
    # トップ画面の表示に必要な処理を記述
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def show
    @employee = current_employee
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path, notice: 'Employee was successfully created.'
    else
      render :new
    end
  end

  def update_attendance
    # 退勤時の処理をここに追加
    employee = Employee.find(params[:id])
    attendance_record = employee.attendance_records.last
    if attendance_record.present?
        attendance_record.clock_out_time = Time.current
        working_hours = attendance_record.calculate_working_hours
        print "退勤時間のところ + #{working_hours[:minutes]}"
        attendance_record.update(
          clock_out_time: attendance_record.clock_out_time,
          work_date: Date.current,
          working_hours: working_hours[:hours] * 60 + working_hours[:minutes]
        )
        puts "working_hours after: #{attendance_record.working_hours}"
        puts "clock_out_time after: #{attendance_record.clock_out_time}"
        redirect_to employee_path(employee), notice: '退勤しました。'
    end
  end

  def salary_statement
    @employee = Employee.find(params[:id])
    @attendance_records = @employee.attendance_records.where("strftime('%m', work_date) = ?", Date.current.strftime('%m'))
    @total_working_hours = calculate_total_working_hours(@attendance_records)
    @hourly_wage = @employee.position.hourly_rate
    @total_salary = calculate_total_salary(@total_working_hours, @hourly_wage)

    render 'salary_statement'
  end

  private

  def calculate_total_working_hours(attendance_records)
    total_hours = attendance_records.sum do |record|
      record.calculate_working_hours[:hours]
    end
    total_minutes = attendance_records.sum do |record|
      record.calculate_working_hours[:minutes]
    end
  
    { hours: total_hours, minutes: total_minutes }
  end

  def calculate_total_salary(total_working_hours, hourly_wage)
    total_minutes = total_working_hours[:hours] * 60 + total_working_hours[:minutes]
    total_salary = total_minutes * hourly_wage / 60.0
    total_salary.to_i
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :login_id, :password, :position_id, :bank_account)
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
