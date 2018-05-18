require 'rails_helper'

RSpec.describe 'User' do
  describe 'signs up' do
    it 'using sign up form' do
      visit sign_up_path
      fill_in 'user[first_name]', with: 'First'
      fill_in 'user[last_name]', with: 'Last'
      fill_in 'user[username]', with: 'username'
      fill_in 'user[email]', with: 'email@example.com'
      fill_in 'user[password]', with: 'Password123'
      click_on 'Sign up for Squawk'
      expect(current_path).to eq chatrooms_path
    end
  end

  describe 'signs in' do
    it 'using sign in form' do
      user = create(:user)
      visit sign_in_path
      fill_in 'session_email', with: user.email
      fill_in 'session_password', with: user.password
      click_on 'Sign in to Squawk'
      expect(current_path).to eq chatrooms_path
    end
  end
end
