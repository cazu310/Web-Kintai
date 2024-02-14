class AddWorkingHoursToAttendanceRecord < ActiveRecord::Migration[6.0]
  def change
    add_column :attendance_records, :working_hours, :integer unless column_exists?(:attendance_records, :working_hours)
  end
end
