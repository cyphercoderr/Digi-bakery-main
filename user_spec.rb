require 'rails_helper'

describe User do
  subject { User.new(email: 'user@example.com') }

  describe "associations" do
    it { should have_many(:ovens) }
    it { should have_many(:stored_cookies) }
  end

  describe "validations" do

  end

  describe "on creation" do
    it "assigns a new oven" do
      user = build(:user)
      expect(user.ovens.count).to eq(0)
      user.save!
      user.reload
      expect(user.ovens.count).to eq(1)
    end
  end
end
