require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create!(name: "Test User", username: "testuser", email: "email@domain.com", password: "password") }
  let(:topic) { Topic.create!(title: "Topic Title", user: user)}
  let(:bookmark) { Bookmark.create!(url: "http://www.espn.com", topic: topic)}
  let(:like) { Like.create!(bookmark: bookmark, user: user)}

  it { should belong_to(:bookmark)}
  it { should belong_to(:user)}

end
