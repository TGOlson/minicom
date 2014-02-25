# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create! name: 'Tyler', email: 'Ty@co.co'
u.messages << Message.create!(text: 'Hey Tyler')
u.messages << Message.create!(text: 'Sup again')

u = User.create! name: 'Bob', email: 'Bob@co.co'
u.messages << Message.create!(text: 'Hey Bob')
u.messages << Message.create!(text: 'Heyheyhey')

User.create! name: 'Duder', email: 'Duder@co.co'
u.messages << Message.create!(text: 'Hey Duder')
u.messages << Message.create!(text: 'Hey there again what up')
