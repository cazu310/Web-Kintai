class CreatePositions < ActiveRecord::Migration[7.1]
  def change
    create_table :positions do |t|
      t.string :name#職種名
      t.decimal :hourly_rate#時給

      t.timestamps
    end
  end
end
