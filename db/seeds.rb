# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Position.create(name: '店長', hourly_rate: 5000)
Position.create(name: '副店長', hourly_rate: 4000)
Position.create(name: 'チーフ', hourly_rate: 3500)
Position.create(name: 'パート', hourly_rate: 2500)
Position.create(name: 'アルバイト', hourly_rate: 1500)

# ターミナルから以下のコマンドを実行してシードデータをデータベースに反映
rails db:seed
