# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(
  name: "Jason Amerine",
  username:  "jamerine",
  email:   "amerine.19@gmail.com",
  password: "password",
)
user.skip_confirmation!
user.save!
