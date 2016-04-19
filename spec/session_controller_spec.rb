require 'rails_helper'
require 'capybara/rspec'
require 'capybara/rails'

describe SessionController, :type => :controller do
   # before :each do
    # User.new(:username => 'user', password: 'password')
  # end

  describe "/login" do
    it "gets the login form" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end
end


describe "SessionView", :type => :feature do
   before :each do
    User.new(:username => 'user', password: 'password')
  end

   it "signs me in" do
    visit '/login'
    within("#login-form") do
      fill_in 'Username', :with => 'user'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Login'
    expect(page).to have_content 'User:'
  end
end

