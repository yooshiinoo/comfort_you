# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'test@test.com',
    password: 'ttestt',
)

users = User.create!(
  [
    {email: 'aaa@test.com', name: '望んで社畜になってない', password: 'aaaaaa'},
    {email: 'bbb@test.com', name: 'ユピ(生理前)', password: 'bbbbbb'},
    {email: 'ccc@test.com', name: '九頭', password: 'cccccc'}
  ]
)

Post.create!(
  [
    {text: 'お金に変えるだけの時間を過ごしている気がする', user_id: users[0].id },
    {text: '小さいことにもイライラしちゃうのやめたい', user_id: users[1].id },
    {text: '死ぬ勇気がないだけ', user_id: users[2].id }
  ]
)
