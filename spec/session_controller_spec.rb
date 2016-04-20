require 'rails_helper'
require 'capybara/rspec'
require 'capybara/rails'

describe SessionController, :type => :controller do
   before :each do
    User.new(:username => 'user', password: 'password')
  end

  describe "/login" do
    it "gets the login form" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end
end
