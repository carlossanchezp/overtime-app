require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      @user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456", first_name: "Jonh", last_name: "Bonfind")
      login_as(@user, scope: :user)
    end

    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of a post' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end

    it 'has list of posts' do
      post1 = Post.create(date: Date.today, rationale: "Post1",user_id: @user.id)
      post2 = Post.create(date: Date.today, rationale: "Post2",user_id: @user.id)
            
      visit posts_path 
 
      expect(page).to have_content(/Post1|Post2/)
    end
  end

  describe "creation" do
    before do
      user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456", first_name: "Jonh", last_name: "Bonfind")
      login_as(user, scope: :user)
      visit new_post_path
    end
    
    it "has a new form that can be reached" do
      expect(page.status_code).to eq(200)
    end
    it "can be created from new form page" do
      visit new_post_path

      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "Some rationale"

      click_on "Save"

      expect(page).to have_content("Some rationale") 
    end

    it "wil have a user associated it" do
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "User_Association"

      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User_Association")     
    end

  end
end