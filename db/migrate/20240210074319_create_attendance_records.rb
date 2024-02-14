class CreateAttendanceRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :attendance_records do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :work_date
      t.datatime :clock_in_time
      t.datatime :clock_out_time
      t.decimal :working_hours

      t.timestamps
    end
  end
end
