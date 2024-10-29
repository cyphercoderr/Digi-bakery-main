require 'rails_helper'

describe BatchCookie do
  subject { BatchCookie.new }

  describe "associations" do
    it { should belong_to(:storage) }
  end

  describe "validations" do
    it { should validate_presence_of(:storage) }
  end
end
