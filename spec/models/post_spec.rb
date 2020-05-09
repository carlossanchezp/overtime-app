require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      @user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456", first_name: "Jonh", last_name: "Bonfind")
      @post = Post.create(date: Date.today, rationale: "Anything",user_id: @user.id)
    end
    it "can be created" do
      expect(@post).to be_valid 
    end

    it "cannot be created without a date and rationale" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).not_to be_valid
    end

  end
end
