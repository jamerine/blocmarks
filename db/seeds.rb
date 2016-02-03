# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#


user = User.new(
  name: "Jason Amerine",
  username:  "jamerine",
  email:   "amerine.19@gmail.com",
  password: "password",
)
user.skip_confirmation!
user.save!

topic = Topic.new(
  title: "Topic Title",
  user: user
)
topic.save!

bookmark = Bookmark.new(
  url: "http://www.espn.com",
  topic: topic
)
bookmark.save!

bookmark2 = Bookmark.new(
  url: "http://www.facebook.com",
  topic: topic
)
bookmark2.save!

bookmark3 = Bookmark.new(
  url: "http://www.twitter.com",
  topic: topic
)
bookmark3.save!
