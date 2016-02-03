require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:user) { User.create!(name: "Test User", username: "testuser", email: "email@domain.com", password: "password") }
  let(:topic) { Topic.create!(title: "Topic Title", user: user)}

  it { should have_many(:bookmarks)}
  it { should belong_to(:user)}
  
  it { should validate_presence_of(:title) }

end
