RSpec.describe MessagesController , type: :controller do
  describe "POST #create" do
    let(:chatroom) { create(:chatroom) }

    it 'broadcasts to messages channel' do
      params = { message: { content: 'Cool!', chatroom_id: chatroom.id } }

      expect {
        post :create, params
      }.to have_broadcasted_to("messages").with(text: 'Cool!')
    end
  end
end
