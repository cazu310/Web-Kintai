class AddForeignKeyToAttendanceRecords < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :attendance_records, :employees
  end
end
