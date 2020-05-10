require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = FactoryBot.create(:user)
    end

    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name, last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe "custom name method" do
    before do
      @user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456", first_name: "Jonh", last_name: "Bonfind")
    end

    it 'has a full name method that combine first and last name' do
      expect(@user.full_name).to eq("BONFIND, JONH")
    end
  end
end
