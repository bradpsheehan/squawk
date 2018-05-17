require 'rails_helper'

RSpec.feature 'Message transmission', js: true do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let!(:chatroom) { create(:chatroom) }

  describe 'in chatroom' do
    xit 'users send and receive messages' do
      login_as(user1)
      click_link chatroom.slug

      expect(current_path).to eq chatroom_path(chatroom.slug)

      message_content = 'Buenos Dias'

      expect(page).not_to have_content(message_content)

      # submit form in new window
      new_window = open_new_window

      within_window new_window do
        visit chatroom_path(chatroom.slug)
        fill_in 'message[content]', with: message_content
        click_on 'send'
      end

      expect do
        switch_to_window(windows.first)
        page.to have_text(project_text)
      end
    end
  end

  def login_as(user)
    visit login_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Submit'
  end
end
