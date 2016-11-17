# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "== Madyness BEGIN =="
Madyness.run
puts "== Madyness DONE =="

puts "== Presse Citron BEGIN =="
PresseCitron.run
puts "== Presse Citron DONE =="

puts "== 1001 Startup BEGIN =="
Mstartups.run
puts "== 1001 Startup DONE =="

puts "== Mashable BEGIN =="
Mashable.run
puts "== Mashable DONE =="
