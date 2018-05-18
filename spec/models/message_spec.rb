require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'model validations' do
    it { should validate_presence_of(:content) }
  end

  describe 'model associations' do
    it { should belong_to(:chatroom) }
    it { should belong_to(:user) }
  end
end

