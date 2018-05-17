require 'rails_helper'

RSpec.describe 'User' do
  describe 'signs up' do
    it 'using signup form' do
      visit signup_path
      fill_in 'user[first_name]', with: 'First'
      fill_in 'user[last_name]', with: 'Last'
      fill_in 'user[username]', with: 'username'
      fill_in 'user[email]', with: 'email@example.com'
      fill_in 'user[password]', with: 'Password123'
      click_on 'Submit'
      expect(current_path).to eq chatrooms_path
    end
  end

  # test login
  # test logout
end
