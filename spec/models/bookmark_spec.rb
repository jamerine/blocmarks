require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:user) { User.create!(name: "Test User", username: "testuser", email: "email@domain.com", password: "password") }
  let(:topic) { Topic.create!(title: "Topic Title", user: user)}
  let(:bookmark) { Bookmark.create!(url: "http://www.espn.com", topic: topic)}

  it { should belong_to(:topic)}

  it { should validate_presence_of(:url) }
end
