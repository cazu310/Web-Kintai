class CreateSalaries < ActiveRecord::Migration[7.1]
  def change
    create_table :salaries do |t|
      t.references :employee, null: false, foreign_key: true
      t.decimal :monthly_salary
      t.decimal :hourly_wage

      t.timestamps
    end
  end
end
