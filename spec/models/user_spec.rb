require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Test User", username: "testuser", email: "email@domain.com", password: "password") }

  it { should have_many(:topics)}

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end
