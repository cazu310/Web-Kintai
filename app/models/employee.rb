# app/models/employee.rb

class Employee < ApplicationRecord
  has_many :attendance_records
  belongs_to :position
  has_one :salary
  validates :name, presence: true
  validates :login_id, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :bank_account, presence: true # 仮のフィールド名です。実際のものに置き換えてください。
  
  def hourly_wage
    # 実際のコードを追加してください
    position.hourly_rate
  end

  def calculate_salary(attendance_record)
    working_hours = attendance_record.calculate_working_hours
    (working_hours * hourly_wage).round(2)
  end
end
