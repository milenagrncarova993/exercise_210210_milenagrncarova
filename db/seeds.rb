# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."

puts "🔴 Users:"
User.destroy_all
p User.all

puts "🔴 GroupEvents:"
GroupEvent.destroy_all
p GroupEvent.all

puts "" 
puts 'Database clean ✅'
puts "" 
puts 'Creating seeds - unfortunately takes a bit ... 😒'

user_array = []

user = User.new
user.email = 'm.g@gmail.com'
user.password = '123456'
user.save!
user_array << user

puts "- Created #{User.count} users."

group_events_array = []

group_events = GroupEvent.new
group_events.name = "Milena's party"
group_events.description = "House Party"
group_events.location = "Berlin"
group_events.start_date = DateTime.new(2021, 02, 10)
group_events.end_date = DateTime.new(2021, 03, 01)
group_events.status = "Draft"
group_events.user = user_array.sample
group_events.save!
group_events_array << group_events 

puts "- Created #{GroupEvent.count} group events."

puts "Finished!"




