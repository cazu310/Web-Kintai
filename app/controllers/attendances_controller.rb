# app/controllers/attendances_controller.rb

class AttendancesController < ApplicationController
  def create
    employee = Employee.find(params[:employee_id])
    attendance = AttendanceRecord.new(employee: employee, clock_in_time: Time.current)

    if attendance.save
      redirect_to employee_path(employee), notice: '出勤しました。'
    else
      redirect_to employee_path(employee), alert: '出勤できませんでした。'
    end
  end
end
