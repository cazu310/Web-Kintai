# app/models/attendance_record.rb

class AttendanceRecord < ApplicationRecord
  belongs_to :employee

  def calculate_working_hours
    if clock_out_time.present? && clock_in_time.present?
      total_minutes = (self.clock_out_time - self.clock_in_time).to_i / 60
      hours = total_minutes / 60
      minutes = total_minutes % 60
  
      # 追加: calculate_working_hours の結果を確認
      puts "calculate_working_hours の結果: #{ { hours: hours, minutes: minutes } }"
  
      { hours: hours, minutes: minutes }
    else
      { hours: 0, minutes: 0 }
    end
  end
  
  def calculate_salary(hourly_wage)
    working_hours = calculate_working_hours
    today_salary = (working_hours[:hours] * 60 + working_hours[:minutes]) * hourly_wage / 60.0
    today_salary.to_i
  end
end
