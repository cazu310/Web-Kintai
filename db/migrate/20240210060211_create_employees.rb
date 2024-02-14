class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :name#従業員名
      t.string :email#連絡先
      t.string :password#パスワード
      t.string :login_id#ログインID
      t.string :bank_account#振込先情報
      t.references :position, null: false, foreign_key: true#職種外部キー

      t.timestamps
    end
  end
end
