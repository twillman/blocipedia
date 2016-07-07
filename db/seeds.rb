# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do
  User.create!(
  email:    Faker::Internet.email,
  password: Faker::Internet.password
  )
end
users = User.all


30.times do
  Wiki.create!(
  user:   users.sample,
  title:  Faker::Lorem.word,
  body:   Faker::Lorem.paragraph
  )
end

admin = User.create!(
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)

member = User.create!(
  email: 'member@example.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
