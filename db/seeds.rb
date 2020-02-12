# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
TagGossip.destroy_all
PrivateMessage.destroy_all

c = 0
10.times do
  City.create(name:Faker::Address.city,zip_code:Faker::Address.zip_code)
  c += 1
  puts "City #{c} created !"
end

ds = 0
10.times do
  User.create(city:City.all.sample,first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, description:Faker::Lorem.paragraph(sentence_count: 2) , email:Faker::Internet.email, age:Faker::Number.number(digits: 2))
  ds += 1
  puts "User #{ds} created !"
end

g = 0

20.times do
  Gossip.create(user:User.all.sample,title:Faker::Book.title, content:Faker::Lorem.paragraph(sentence_count: 2))
  g += 1
  puts "Gossip #{g} created !"
end

t = 0
10.times do
  Tag.create(title:Faker::Book.title)
  t += 1
  puts "Tag #{t} created !"
end

tg = 0
for i in 1..Gossip.all.length do
  TagGossip.create(gossip:Gossip.find(i),tag:Tag.all.sample)
  tg += 1
  puts "Gossip & Tag #{tg} linked !"
end

20.times do
  TagGossip.create(gossip:Gossip.all.sample,tag:Tag.all.sample)
  tg += 1
  puts "Gossip & Tag #{tg} linked !"
end

m = 0

20.times do
  PrivateMessage.create(recipient:User.all.sample,sender:User.all.sample,content:Faker::Lorem.paragraph(sentence_count: 2))
  m += 1
  puts "Message #{m} successfully sent !"
end